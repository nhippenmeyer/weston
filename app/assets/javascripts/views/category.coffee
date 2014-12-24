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
    @renderLeftRightPages(@pageLeft?.name, @pageRight?.name) if @pageLeft or @pageRight
    @renderQuote()
    @renderProjects()
    _.defer =>
      @$('.project').each -> $(this).css('height', $(this).width() * .75)
    this

  renderQuote: ->
    quote = Weston.Data.Quotes[@category].quote
    author = Weston.Data.Quotes[@category].author
    @$('.quote-text').html("\"#{quote}\"")
    @$('.quote-author').html("- #{author}")

  renderProjects: ->
    index = 0
    for slug, copy of Weston.Data.Projects[@category]
      $el = $("
        <div class='single-wide project #{slug}'>
          <a href='#projects/#{slug}'>
            <div class='overlay'></div>
            <h2 class='title'>#{copy.title}</h2>
          </a>
        </div>")
      if index % 2 is 0
        $el.addClass('left')
      else
        $el.addClass('right')
      @$('.projects').append($el)
      @$('.projects').append("<div class='clear'></div>") if index % 2 is 1
      index += 1
    @$('.projects').append("<div class='clear'></div>")

  scrollDown: (e) ->
    @$('>.category-content').animate
      scrollTop: @$('>.category-content .landing-page').height()
    , 500
