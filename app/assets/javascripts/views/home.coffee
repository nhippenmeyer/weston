class Weston.Views.Home extends Backbone.View

  template: JST['home']
  footerTemplate: JST['footer']

  events: ->
    'click .tile'      : 'clickTile'
    'click .down-arrow': 'scrollDown'

  render: ->
    super
    @$el.html(@template())
    @$('.footer-container').html(@footerTemplate())
    $('header td').removeClass('selected')
    this

  scrollDown: (e) ->
    $el = $(e.currentTarget).closest('.page').next('.page')
    @$('#page-content').animate
      scrollTop: $el.position().top
    , 500
