class Weston.Views.Category extends Backbone.View

  className: 'category-page'

  layoutTemplate: JST['category']
  footerTemplate: JST['footer']
  template: -> ""

  events:
    'click .nav-left' : 'navigateLeft'
    'click .nav-right': 'navigateRight'
    'click .nav-down' : 'scrollDown'

  initialize: (opts = {}) ->
    { pages } = opts
    @setSiblingPages(pages)
    $(window).resize @resizeImages

  render: ->
    super
    @$el.html(@layoutTemplate(category: @category))
    @$('.footer-container').html(@footerTemplate())
    @$('.header h1').html(@name)
    for subheader in @subheaders
      @$('.subheaders').append("<div>#{subheader}</div>")
    $('header .work').addClass('selected').siblings().removeClass('selected')
    $('.category-header').addClass('visible')
    $('.nav').data('page', 'work')
    @renderLeftRightPages(@pageLeft?.name, @pageRight?.name) if @pageLeft or @pageRight
    @renderDescription()
    @renderQuote()
    @renderProjects()
    _.defer @resizeImages
    this

  renderDescription: ->
    @$('.description p').html(Weston.Data.Descriptions[@category])

  renderQuote: ->
    quote = Weston.Data.Quotes[@category].quote
    author = Weston.Data.Quotes[@category].author
    @$('.quote-text').html("\"#{quote}\"")
    @$('.quote-author').html("- #{author}")

  renderProjects: ->
    index = 0
    for slug, copy of Weston.Data.Projects[@category]
      if $(window).width() > 800
        $el = $("
          <div class='single-wide project #{slug}'>
            <div class='overlay'></div>
            <div class='text-container'>
              <h2 class='title'>#{copy.title}</h2>
              <a href='#projects/#{slug}'>View Project</a>
            </div>
          </div>")
      else
        $el = $("
          <a href='#projects/#{slug}''>
            <div class='single-wide project #{slug}'></div>
          </a>")
      if index % 2 is 0
        $el.addClass('left')
      else
        $el.addClass('right')
      @$('.projects').append($el)
      @$('.projects').append("<div class='clear'></div>") if index % 2 is 1
      index += 1
    @$('.projects').append("<div class='clear'></div>")

  resizeImages: =>
    @$('.project').each -> $(this).css('height', $(this).width() * .75)

  scrollDown: (e) ->
    @$('>.category-content').animate
      scrollTop: @$('>.category-content .landing-page').height() - 75
    , 500
