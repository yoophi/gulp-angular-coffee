class LoginModalController extends BaseController
  @inject '$scope', '$uibModalInstance', 'items'

  initialize: ->
    console.log 'LoginModalController:items', @items

  ok: () ->
    @$uibModalInstance.close(true)

  cancel: () ->
    @$uibModalInstance.dismiss('cancel')


angular.module 'hashtagramSandbox'
.controller 'LoginModalController', LoginModalController
