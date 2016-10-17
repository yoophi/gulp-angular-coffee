class MainController extends BaseController
  @inject '$scope', '$timeout', 'webDevTec', 'toastr'

  initialize: ->
    @awesomeThings = []
    @classAnimation = ''
    @creationDate = 1476427022416
    @activate()
    return

  activate: ->
    @getWebDevTec()
    @$timeout (=>
      @classAnimation = 'rubberBand'
      return
    ), 4000
    return

  showToastr: ->
    @toastr.info 'Fork <a href="https://github.com/Swiip/generator-gulp-angular" target="_blank"><b>generator-gulp-angular</b></a>'
    @classAnimation = ''
    return

  getWebDevTec: ->
    @awesomeThings = @webDevTec.getTec()
    angular.forEach @awesomeThings, (awesomeThing) ->
      awesomeThing.rank = Math.random()
      return
    return

  login: ->
    console.log 'MainController.login()'


angular.module 'hashtagramSandbox'
  .controller 'MainController', MainController
