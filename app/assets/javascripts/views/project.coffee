class Weston.Views.Project extends Backbone.View

  className: 'project-page'
  template: JST['project']

  copy: Weston.Data.Projects

  events:
    'click .nav-left' : 'navigateLeft'
    'click .nav-right': 'navigateRight'

  navLeftRoute: -> "#projects/#{@leftProjectSlug()}"
  navRightRoute: -> "#projects/#{@rightProjectSlug()}"

  navLeftPage: ->
    slug = @leftProjectSlug()
    if slug then new Weston.Views.Project(project: slug, pages: false) else undefined

  navRightPage: ->
    slug = @rightProjectSlug()
    if slug then new Weston.Views.Project(project: slug, pages: false) else undefined

  leftProjectSlug: ->
    projects = @copy[@getProjectCategory()]
    i = _.indexOf(Object.keys(projects), @project)
    if i > 0
      Object.keys(projects)[i-1]
    else
      undefined

  rightProjectSlug: ->
    projects = @copy[@getProjectCategory()]
    i = _.indexOf(Object.keys(projects), @project)
    if i < Object.keys(projects).length - 1
      Object.keys(projects)[i+1]
    else
      undefined

  initialize: (opts) ->
    { @project, pages } = opts
    @setSiblingPages(pages)

  getProjectCategory: ->
    for category, projects of @copy
      for project, copy of projects
        return category if project is @project

  getProjectCopy: ->
    @copy[@getProjectCategory()][@project]

  getProjectImageURLs: ->
    "/assets/project-details/#{@getProjectCategory()}/#{@project}"

  render: ->
    @$el.html(@template())
    @renderLeftRightPages("Previous Project", "Next Project")
    @renderImages()
    @renderCopy()
    @pageLeft.render() if @pageLeft
    @pageRight.render() if @pageRight
    this

  renderImages: ->
    @$('.landing-wrap').css('background-image', "url(#{@getProjectImageURLs()}/cover.jpg)")
    @$('.single-wide.first').css('background-image', "url(#{@getProjectImageURLs()}/1.jpg)")
    @$('.single-wide.second').css('background-image', "url(#{@getProjectImageURLs()}/2.jpg)")
    @$('.single-wide.third').css('background-image', "url(#{@getProjectImageURLs()}/3.jpg)")
    i = 4
    while i <= 7
      $img = $("<div class='image'></div>")
      $img.css('background-image', "url(#{@getProjectImageURLs()}/#{i}.jpg)")
      @$('.details').append($img)
      i++

  renderCopy: ->
    @$('.copy-container').append("<h1>#{@getProjectCopy().title}</h1>")
    @$('.copy-container').append("<p>#{@getProjectCopy().paragraph}</p>")
    @$('.copy-container').append("<a href='#{@getProjectCopy().paragraph}' target='_blank'>Visit the site</a>")

    quote = Weston.Data.Quotes[@getProjectCategory()].quote
    author = Weston.Data.Quotes[@getProjectCategory()].author
    @$('.quote-text').html("\"#{quote}\"")
    @$('.quote-author').html("- #{author}")
