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
    _.defer => @$('.project').each -> $(this).css('height', $(this).width() * .75)
    this

  renderQuote: ->
    quote = Weston.Data.Quotes[@category].quote
    author = Weston.Data.Quotes[@category].author
    @$('.quote-text').html("\"#{quote}\"")
    @$('.quote-author').html("- #{author}")

  renderProjects: ->
    projects = []
    for slug, copy of Weston.Data.Projects[@category]
      projects.push("
        <td class='project #{slug}'>
          <a href='#projects/#{slug}'>
            <div class='overlay'></div>
            <h2 class='title'>#{copy.title}</h2>
          </a>
        </td>")
    i = 0
    while i < projects.length
      @$('.projects table').append("<tr>#{projects[i]}#{projects[i+1]}")
      i += 2

  scrollDown: (e) ->
    @$('>.category-content').animate
      scrollTop: @$('>.category-content .landing-page').height()
    , 500
