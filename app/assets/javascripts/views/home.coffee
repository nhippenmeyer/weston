class Weston.Views.Home extends Backbone.View

  template: JST['home']

  events: ->
    'click .tile'      : 'clickTile'
    'click .down-arrow': 'scrollDown'

  render: ->
    @$el.html(@template())
    super
    $('header td').removeClass('selected')
    this

  scrollDown: (e) ->
    $el = $(e.currentTarget).closest('.page').next('.page')
    @$('#page-content').animate
      scrollTop: $el.position().top
    , 500
