class AppController extends BaseController
  @inject '$scope', '$log'

  hello: ->
    @$log.debug 'hello, world'



angular.module 'hashtagramSandbox'
.controller 'AppController', AppController
