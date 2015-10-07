class Weston.Views.Home extends Backbone.View

  template: JST['home']
  footerTemplate: JST['footer']

  events: ->
    'click .tile'      : 'clickTile'
    'click .down-arrow': 'scrollDown'

  render: ->
    @$el.html(@template())
    @$('.footer-container').html(@footerTemplate())
    $('header td').removeClass('selected')
    this

  clickTile: (e) ->
    $el = $(e.currentTarget)
    $el.siblings().addClass('inactive')
    $el.addClass('active')
    $('#page-content').animate
      scrollTop: $el.position().top
    , 1500
    setTimeout =>
      @showTile(e)
    , 1500

  showTile: (e) ->
    $target = $(e.target).closest('.tile')
    Backbone.history.navigate $target.data('route'), trigger: true

  scrollDown: (e) ->
    $el = $(e.currentTarget).closest('.page').next('.page')
    @$('#page-content').animate
      scrollTop: $el.position().top
    , 500
