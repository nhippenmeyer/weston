window.Weston =
  Data: {}
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}

  init: ->
    @layout = new Weston.Views.Layout
    $('body').html(@layout.render().el)
    new Weston.Routers.Home
    new Weston.Routers.Categories
    new Weston.Routers.Projects
    Backbone.history.on 'route', @onRouteChange
    Backbone.history.start()

  onRouteChange: (router, route) =>
    $('#page-content').off 'scroll'
    $('#page-content').scroll router.onScroll if router.onScroll
    Weston.layout.$el.attr('data-page', route)
    Weston.layout.$('#page-wrap').removeClass('nav-active')

$(document).ready ->
  Weston.init()
