class Weston.Views.Home extends Backbone.View

  template: JST['home']

  events: ->
    'click .tile'      : 'clickTile'
    'click .down-arrow': 'scrollDown'

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
    @onTransitionEnd($el[0], @showTile)

  showTile: (e) ->
    Backbone.history.navigate $(e.target).data('route'), trigger: true

  scrollDown: (e) ->
    $el = $(e.currentTarget).closest('.page').next('.page')
    @$('.content').animate
      scrollTop: $el.offset().top
    , 500
