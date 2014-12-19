class Weston.Views.Category extends Backbone.View

  className: 'category-page'

  layoutTemplate: JST['category']
  template: -> ""

  events:
    'click .nav-left' : 'navigateLeft'
    'click .nav-right': 'navigateRight'
    'click .nav-down' : 'scrollDown'

  initialize: (opts = {}) ->
    { pages } = opts
    @setSiblingPages(pages)

  render: ->
    @$el.html(@layoutTemplate(category: @category))
    @$('.header h1').html(@name)
    @$('.projects').html(@projectsTemplate())
    @renderLeftRightPages(@pageLeft?.name, @pageRight?.name) if @pageLeft or @pageRight

    quote = Weston.Data.Quotes[@category].quote
    author = Weston.Data.Quotes[@category].author
    @$('.quote-text').html("\"#{quote}\"")
    @$('.quote-author').html("- #{author}")

    _.defer => @$('.project').each -> $(this).css('height', $(this).width() * .75)
    this

  scrollDown: (e) ->
    @$('>.category-content').animate
      scrollTop: @$('>.category-content .landing-page').height()
    , 500
