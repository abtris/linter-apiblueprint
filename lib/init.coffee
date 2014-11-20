path = require 'path'

module.exports =
  config:
    executablePath:
      type: 'string'
      default: 'snowcrash'
      description: 'Path to snowcrash.'

  activate: ->
    console.log 'activate linter-apiblueprint'
