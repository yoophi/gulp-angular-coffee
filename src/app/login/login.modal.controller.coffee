class LoginModalController extends BaseController
  @inject '$scope', '$log', '$uibModalInstance',
    'toastr', 'items', 'ApiService', 'UserService'

  initialize: ->
    console.log 'LoginModalController:items', @items

  handleLogin: ->
    @$log.debug @$scope.loginData

    {username, password} = @$scope.loginData

    @ApiService.login username, password
    .then (response) =>
      @$log.debug 'response', response
      response
    , (err) =>
      @$q.reject err

    .then (login_response) =>
      @toastr.info 'Login Succes'
      @$log.debug 'login_response', login_response
      @UserService.getProfile()

#    .then (profile_response) =>
#      @$log.debug 'profile_response', profile_response
#      @$log.debu profile_response.data.data

#      @UserService.model.profile = profile_response.data.data

    @$uibModalInstance.close(true)

  ok: () ->
    @$uibModalInstance.close(true)

  cancel: () ->
    @$uibModalInstance.dismiss('cancel')


angular.module 'hashtagramSandbox'
.controller 'LoginModalController', LoginModalController
