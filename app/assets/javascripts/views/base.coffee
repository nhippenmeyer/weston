Backbone.View::onTransitionEnd = (el, fn) ->
  el.addEventListener 'webkitTransitionEnd', fn, false
  el.addEventListener 'transitionend', fn, false
  el.addEventListener 'msTransitionEnd', fn, false
  el.addEventListener 'oTransitionEnd', fn, false
