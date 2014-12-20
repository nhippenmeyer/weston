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
    "http://s3.amazonaws.com/westonbakerdesign/project-details/#{@getProjectCategory()}/#{@project}"

  render: ->
    @$el.html(@template())
    @renderLeftRightPages("Previous Project", "Next Project")
    @renderCopy()
    @renderImages()
    @pageLeft.render() if @pageLeft
    @pageRight.render() if @pageRight
    this

  renderImages: ->
    @$('.landing-wrap').css('background-image', "url(#{@getProjectImageURLs()}/cover.jpg)")
    @$('.single-wide.image').css('background-image', "url(#{@getProjectImageURLs()}/1.jpg)")
    i = 2
    while i <= @getProjectCopy().photos.length
      size = @getProjectCopy().photos[i-1]
      if size is 1
        @appendSingleWideImages(i)
        i += 2
      else if size is 2
        @appendDoubleWideImage(i)
        i += 1

  appendDoubleWideImage: (i) ->
    $img = $("<div class='image'></div>")
    $img.css('background-image', "url(#{@getProjectImageURLs()}/#{i}.jpg)")
    @$('.images').append($img)

  appendSingleWideImages: (i) ->
    $img = $("<div class='single-wide image left'></div>")
    $img.css('background-image', "url(#{@getProjectImageURLs()}/#{i}.jpg)")
    @$('.images').append($img)
    if i+1 < @getProjectCopy().photos.length
      $img = $("<div class='single-wide image right'></div>")
      $img.css('background-image', "url(#{@getProjectImageURLs()}/#{i+1}.jpg)")
      @$('.images').append($img)
    @$('.images').append("<div class='clear'></div>")

  renderCopy: ->
    @$('.copy-container').append("<h1>#{@getProjectCopy().title}</h1>")
    @$('.copy-container').append("<p>#{@getProjectCopy().paragraph}</p>")
    @$('.copy-container').append("<a href='#{@getProjectCopy().paragraph}' target='_blank'>Visit the site</a>")

    quote = Weston.Data.Quotes[@getProjectCategory()].quote
    author = Weston.Data.Quotes[@getProjectCategory()].author
    @$('.quote-text').html("\"#{quote}\"")
    @$('.quote-author').html("- #{author}")
