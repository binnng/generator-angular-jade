'use strict'

###*
 # @ngdoc overview
 # @name app
 # @description
 # # app
 #
 # Main module of the application.
###
angular
  .module('app', [
    'ngAnimate',
    'ngAria',
    'ngCookies',
    'ngMessages',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch'
  ])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main'
        controller: 'MainCtrl'
      .when '/about',
        templateUrl: 'views/about'
        controller: 'AboutCtrl'
      .otherwise
        redirectTo: '/'

