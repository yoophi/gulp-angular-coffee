#class ApiInterceptorService extends BaseService
#  @inject '$q', '$injector'
ApiInterceptorService  = ($injector, $q) ->
  return {
    request: (config) ->
      ApiService = $injector.get 'ApiService'
      if (
        ApiService.isLoggedIn() and
          config.url.indexOf(ApiService.getEndpoint()) == 0 and
          config.url.indexOf('/oauth/token') == -1
      )
        config.params = config.params || {}
        config.params.access_token = ApiService.getAccessToken()

      config

    requestError: (rejection) ->
      $q.reject rejection

    response: (response) ->
      response

    responseError: (rejection) ->
      if (
        rejection.status == 400 and
          rejection.data.meta and
          rejection.data.meta.error_type == 'OAuthParameterException'
      )
        rejection.status = 401

      $q.reject rejection
  }


angular.module 'hashtagramSandbox'
  .factory 'ApiInterceptorService', ApiInterceptorService
