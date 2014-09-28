class Weston.Views.Home extends Backbone.View

  template: JST['home']

  events: ->
    'click .tile': 'clickTile'

  render: ->
    @$el.html(@template())
    this

  clickTile: (e) ->
    $el = $(e.currentTarget)
    $el.siblings().addClass('inactive')
    $el.addClass('active')
    $('html, body').animate
      scrollTop: $el.offset().top
    , 1500
    $el[0].addEventListener 'webkitTransitionEnd', @showTile, false
    $el[0].addEventListener 'transitionend', @showTile, false
    $el[0].addEventListener 'msTransitionEnd', @showTile, false
    $el[0].addEventListener 'oTransitionEnd', @showTile, false

  showTile: (e) ->
    Backbone.history.navigate $(e.target).data('route'), trigger: true
