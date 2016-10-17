angular.module 'hashtagramSandbox'
  .config ($stateProvider, $urlRouterProvider) ->
    'ngInject'
    $stateProvider
      .state 'app',
        url: '/'
        templateUrl: 'app/app/app.html'
        controller: 'AppController'
        controllerAs: 'app'

      .state 'app.home',
        url: 'home'
        templateUrl: 'app/main/main.html'
        controller: 'MainController'
        controllerAs: 'main'

      .state 'app.about',
        url: 'about'
        templateUrl: 'app/about/about.html'
        controller: 'AboutController'
        controllerAs: 'about'

      .state 'app.contact',
        url: 'contact'
        templateUrl: 'app/contact/contact.html'
        controller: 'ContactController'
        controllerAs: 'contact'

    $urlRouterProvider.otherwise '/home'
