class AppController extends BaseController
  @inject '$scope', '$log', '$uibModal', 'ApiService'

  initialize: ->
    @items = ['item1', 'item2', 'item3']
    @animationsEnabled = true

  hello: ->
    @$log.debug 'hello, world'

  login: ->
    @$log.debug 'AppController.login()'
    @ApiService.login 'hello', 'world'
    modalInstance = @$uibModal.open
      animation: @animationsEnabled
      ariaLabelledBy: 'modal-title',
      ariaDescribedBy: 'modal-body',
      templateUrl: '/app/login/modal-content.html',
      controller: 'LoginModalController',
      controllerAs: '$ctrl',
#      size: size,
      resolve:
        items: () =>
          return @items

    modalInstance.result.then (result) ->
      console.log 'result', result
    , () ->
      console.log 'modal dismissed at: ' + new Date()


angular.module 'hashtagramSandbox'
  .controller 'AppController', AppController
