class Weston.Views.Category extends Backbone.View

  className: 'category-page'

  layoutTemplate: JST['category']
  template: -> ""

  events:
    'click .nav-left' : 'navigateLeft'
    'click .nav-right': 'navigateRight'

  initialize: (opts = {}) ->
    { pages } = opts
    unless pages is false
      @pageLeft = @navLeftPage() if @navLeftPage
      @pageRight = @navRightPage() if @navRightPage

  render: ->
    @$el.html(@layoutTemplate(category: @category))
    @$('.header h1').html(@name)
    if @pageLeft
      @$('.nav-left').html(
        "<div class='icon'></div><div class='text'>#{@pageLeft.name}</div>")
      @$el.prepend(@pageLeft.render().el)
    if @pageRight
      @$('.nav-right').html(
        "<div class='text'>#{@pageRight.name}</div><div class='icon'></div")
      @$el.append(@pageRight.render().el)
    this

  navigateLeft: ->
    return unless @pageLeft
    @$el.css('transform': 'translate3d(100%, 0, 0')
    @onTransitionEnd @el, =>
      Backbone.history.navigate @navLeftRoute, trigger: true

  navigateRight: ->
    return unless @pageRight
    @$el.css('transform': 'translate3d(-100%, 0, 0')
    @onTransitionEnd @el, =>
      Backbone.history.navigate @navRightRoute, trigger: true
