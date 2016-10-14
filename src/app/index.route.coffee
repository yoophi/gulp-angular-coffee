angular.module 'hashtagramSandbox'
  .config ($stateProvider, $urlRouterProvider) ->
    'ngInject'
    $stateProvider
      .state 'home',
        url: '/'
        templateUrl: 'app/main/main.html'
        controller: 'MainController'
        controllerAs: 'main'

      .state 'about',
        url: '/about'
        templateUrl: 'app/about/about.html'
        controller: 'AboutController'
        controllerAs: 'about'

    $urlRouterProvider.otherwise '/'
