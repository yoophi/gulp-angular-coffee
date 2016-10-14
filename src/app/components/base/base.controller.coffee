## Mixin
## http://arcturo.github.io/library/coffeescript/03_classes.html

moduleKeywords = ['extended', 'included']

class Module
  @extend: (obj) ->
    for key, value of obj when key not in moduleKeywords
      @[key] = value

    obj.extended?.apply(@)
    this

  @include: (obj) ->
    for key, value of obj when key not in moduleKeywords
      # Assign properties to the prototype
      @::[key] = value

    obj.included?.apply(@)
    this


class BaseController extends Module
  @inject: (args...) ->
    @$inject = args

  constructor: (args...) ->
    for key, index in @constructor.$inject
      this[key] = args[index]
    @scope = @$scope if @$scope?

    for key, fn of @constructor.prototype
      continue if key in ['constructor', 'initialize'] or key[0] is '_'
      do (key) =>
        fn = fn.bind?(this) || _.bind(fn, this) if typeof fn is 'function'
        Object.defineProperty this, key,
          get: -> @scope[key]
          set: (v) -> @scope[key] = v
        @scope[key] = fn

    @initialize?.call(this)
