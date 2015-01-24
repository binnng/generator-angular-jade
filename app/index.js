// Generated by CoffeeScript 1.7.1
"use strict";
var chalk, fs, join, yeoman;

join = require("path").join;

yeoman = require("yeoman-generator");

chalk = require("chalk");

fs = require("fs");

module.exports = yeoman.generators.Base.extend({
  constructor: function() {
    yeoman.generators.Base.apply(this, arguments);
    this.option("coffee", {
      desc: "Use CoffeeScript",
      type: Boolean,
      defaults: false
    });
    this.coffee = this.options.coffee;
    return this.pkg = require("../package.json");
  },
  askFor: function() {
    var prompts;
    this.log(require("yosay")());
    prompts = [
      {
        type: "checkbox",
        name: "features",
        message: "What more would you like?",
        choices: [
          {
            name: "Bootstrap",
            value: "includeBootstrap",
            checked: true
          }, {
            name: "Sass",
            value: "includeSass",
            checked: false
          }, {
            name: "Modernizr",
            value: "includeModernizr",
            checked: false
          }
        ]
      }, {
        when: function(answers) {
          return answers && answers.features && answers.features.indexOf("includeSass") !== -1;
        },
        type: "confirm",
        name: "libsass",
        value: "includeLibSass",
        message: "Would you like to use libsass? Read up more at \n" + chalk.green("https://github.com/andrew/node-sass#node-sass"),
        "default": false
      }
    ];
    return this.prompt(prompts, (function(answers) {
      var features, hasFeature;
      hasFeature = function(feat) {
        return features && features.indexOf(feat) !== -1;
      };
      features = answers.features;
      this.includeSass = hasFeature("includeSass");
      this.includeBootstrap = hasFeature("includeBootstrap");
      this.includeModernizr = hasFeature("includeModernizr");
      this.includeLibSass = answers.libsass;
      this.includeRubySass = !answers.libsass;
      return done();
    }).bind(this));
  }
});