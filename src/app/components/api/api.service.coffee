class ApiService extends BaseService
  @inject '$http', '$httpParamSerializer', '$interval', '$log', '$q',
    'API_ENDPOINT', 'authService', 'localStorageService'

  login: (username, password) ->
    @$log.debug 'login:'
    @$log.debug username, password

  logout: ->
    @$log.debug 'logout:'


angular.module 'hashtagramSandbox'
  .service 'ApiService', ApiService
