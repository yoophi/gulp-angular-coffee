class AppController extends BaseController
  @inject '$scope', '$log', '$state', '$uibModal',
    'ApiService', 'UserService', 'toastr'

  initialize: ->
    @$scope.user = @UserService.getModel()
    @items = ['item1', 'item2', 'item3']
    @animationsEnabled = true
    @$scope.loginData = {}

    if @ApiService.isLoggedIn()
      @$log.debug 'ApiService.isLoggedIn()'
      @UserService.getProfile()

  isLoggedIn: ->
    @ApiService.isLoggedIn()

  logout: ->
    @ApiService.logout()
    @toastr.info 'Logout Success'

    for svc in [@UserService]
      svc.clear?()

    @$state.go 'app.home'

  showLogin: ->
    @$log.debug 'AppController.login()'

    m = @$uibModal.open
      animation: @animationsEnabled
      ariaLabelledBy: 'modal-title',
      ariaDescribedBy: 'modal-body',
      templateUrl: '/app/login/modal-content.html',
      controller: 'LoginModalController',
      controllerAs: '$ctrl',
      scope: @$scope,
      resolve:
        items: () =>
          return @items

    m.result.then (result) =>
      @$log.debug 'result', result
    , () ->
      @$log.debug 'modal dismissed at: ' + new Date()


angular.module 'hashtagramSandbox'
  .controller 'AppController', AppController
