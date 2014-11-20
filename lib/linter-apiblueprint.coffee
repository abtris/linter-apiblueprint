linterPath = atom.packages.getLoadedPackage('linter').path
Linter = require "#{linterPath}/lib/linter"
findFile = require "#{linterPath}/lib/util"

class LinterApiblueprint extends Linter
  # The syntax that the linter handles. May be a string or
  # list/tuple of strings. Names should be all lowercase.
  @syntax: ['source.apib']

  # A string, list, tuple or callable that returns a string, list or tuple,
  # containing the command line (with arguments) used to lint.
  cmd: 'snowcrash -l'

  linterName: 'apiblueprint'

  # A regex pattern used to extract information from the executable's output.
  regex:
    'error: (?<line>\\d+)' +
    # '.+?lineEnd="\\d+"' +
    ' (?<message>.+?) :(?<col>[0-9]+):(?<size>[0-9]+)'

  constructor: (editor) ->
    super(editor)

    atom.config.observe 'linter-apiblueprint.snowcrashExecutablePath', =>
      @executablePath = atom.config.get 'linter-apiblueprint.snowcrashExecutablePath'
      log 'linter-apiblueprint.snowcrashExecutablePath', @executablePath

  destroy: ->
    atom.config.unobserve 'linter-apiblueprint.snowcrashExecutablePath'

module.exports = LinterApiblueprint
