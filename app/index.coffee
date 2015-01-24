"use strict"

join = require("path").join
yeoman = require "yeoman-generator"
chalk = require "chalk"
fs = require "fs"


module.exports = yeoman.generators.Base.extend
  constructor: ->
    yeoman.generators.Base.apply @, arguments

    @option "coffee", 
      desc: "Use CoffeeScript"
      type: Boolean
      defaults: off

    @coffee = @options.coffee
    @pkg = require "../package.json"

  askFor: ->
    @log require("yosay")()

    prompts = [
      {
        type: "checkbox"
        name: "features"
        message: "What more would you like?"
        choices: [
          {
            name: "Bootstrap"
            value: "includeBootstrap"
            checked: true
          }
          {
            name: "Sass"
            value: "includeSass"
            checked: false
          }
          {
            name: "Modernizr"
            value: "includeModernizr"
            checked: false
          }
        ]
      }
      {
        when: (answers) ->
          answers and answers.features and answers.features.indexOf("includeSass") isnt -1

        type: "confirm"
        name: "libsass"
        value: "includeLibSass"
        message: "Would you like to use libsass? Read up more at \n" + chalk.green("https://github.com/andrew/node-sass#node-sass")
        default: false
      }
    ]

    @prompt prompts, ((answers) ->
      hasFeature = (feat) ->
        features and features.indexOf(feat) isnt -1
        
      features = answers.features
      @includeSass = hasFeature("includeSass")
      @includeBootstrap = hasFeature("includeBootstrap")
      @includeModernizr = hasFeature("includeModernizr")
      @includeLibSass = answers.libsass
      @includeRubySass = not answers.libsass
      done()
    ).bind(this)



