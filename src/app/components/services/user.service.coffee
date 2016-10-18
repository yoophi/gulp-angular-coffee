class UserService extends BaseService
  @inject 'ApiService', '$log'

  initialize: ->
    @model =
      profile: {}

  clear: ->
    @model.profile = {}

  getModel: ->
    @model

  getProfile: ->
    @ApiService.getUserProfile()
    .success (res) =>
      @model.profile = res


angular.module 'hashtagramSandbox'
  .service 'UserService', UserService
