'use strict'

###*
 # @ngdoc function
 # @name app.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the app
###
angular.module('app')
  .controller 'MainCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
