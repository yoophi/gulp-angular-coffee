class ApiService extends BaseService
  @inject '$http', '$httpParamSerializer', '$interval', '$log', '$q',
    'API_ENDPOINT', 'authService', 'localStorageService',

  initialize: ->


  login: (username, password) ->
    @$log.debug 'ApiService.login:'
    @$log.debug username, password

    LOGIN_URL = @API_ENDPOINT + '/oauth/token'
    params =
      grant_type: 'password'
      client_id: 'angular'
      client_secret: 'secret'
      scope: 'email'
      username: username
      password: password

    req =
      method: 'POST'
      url: LOGIN_URL
      headers:
        'Content-Type': 'application/x-www-form-urlencoded'
      data: @$httpParamSerializer(params)
      ignoreAuthModule: true

    @$http(req).success (response) =>
      q = @$q.defer()
      if response.access_token?
        configUpdater = (config) =>
          config.params = config.params or {}
          config.params.access_token = response.access_token
          config

        @localStorageService.set 'accessToken', response.access_token
        @localStorageService.set 'refreshToken', response.refresh_token
        @authService.loginConfirmed null, configUpdater

        q.resolve true
      else
        q.reject 'login failed'

    .error (data, status) =>
      @$q.reject data


  logout: ->
    @$log.debug 'logout:'
    for s in ['accessToken', 'refreshToken', 'refreshed']
      @localStorageService.remove s

  getEndpoint: ->
    @API_ENDPOINT

  getUserProfile: () ->
    @$log.debug 'getUserProfile'
    @$http.get "#{@API_ENDPOINT}/users/self"
      .error (data, status) =>
        @$log.debug 'error', data, status

  getAccessToken: ->
    @localStorageService.get 'accessToken'

  isLoggedIn: () ->
    !! @getAccessToken()


angular.module 'hashtagramSandbox'
  .service 'ApiService', ApiService
