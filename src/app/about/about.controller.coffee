class AboutController extends BaseController
  @inject '$scope', '$log'

  hello: ->
    @$log.debug 'hello, world'



angular.module 'hashtagramSandbox'
  .controller 'AboutController', AboutController
