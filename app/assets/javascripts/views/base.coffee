Backbone.View::onTransitionEnd = (el, fn) ->
  el.addEventListener 'webkitTransitionEnd', fn, false
  el.addEventListener 'transitionend', fn, false
  el.addEventListener 'msTransitionEnd', fn, false
  el.addEventListener 'oTransitionEnd', fn, false

Backbone.View::renderLeftRightPages = (pageLeftName, pageRightName) ->
  $navLeft = @$('.nav-left')
  $navRight = @$('.nav-right')
  if @pageLeft
    $navLeft.html(
      "<div class='icon'></div><div class='text'>#{pageLeftName}</div>")
    @$el.prepend(@pageLeft.render().el)
  if @pageRight
    $navRight.html(
      "<div class='text'>#{pageRightName}</div><div class='icon'></div")
    @$el.append(@pageRight.render().el)

Backbone.View::navigateLeft = ->
  return unless @pageLeft
  @$el.css('transform': 'translate3d(100%, 0, 0')
  setTimeout =>
    Backbone.history.navigate @navLeftRoute(), trigger: true
    $('#page-region').html(@pageLeft.reRender().el)
    @pageLeft.delegateEvents()
  , 750

Backbone.View::navigateRight = ->
  return unless @pageRight
  @$el.css('transform': 'translate3d(-100%, 0, 0')
  setTimeout =>
    Backbone.history.navigate @navRightRoute(), trigger: true
    $('#page-region').html(@pageRight.reRender().el)
    @pageRight.delegateEvents()
  , 750

Backbone.View::setSiblingPages = (pages) ->
  unless pages is false
    @pageLeft = @navLeftPage() if @navLeftPage and @navLeftPage() isnt undefined
    @pageRight = @navRightPage() if @navRightPage and @navRightPage isnt undefined

Backbone.View::reRender = ->
  @setSiblingPages(true)
  @render()
