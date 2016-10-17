class ContactController extends BaseController
  @inject '$scope', '$log'

  hello: ->
    @$log.debug 'hello, world'



angular.module 'hashtagramSandbox'
  .controller 'ContactController', ContactController
