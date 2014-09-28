window.Weston =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}

  init: ->
    @layout = new Weston.Views.Layout
    $('body').html(@layout.render().el)
    new Weston.Routers.Home
    new Weston.Routers.Categories
    Backbone.history.on 'route', @onRouteChange
    Backbone.history.start()

  onRouteChange: (route) =>
    $(window).off 'scroll'
    $(window).scroll route.onScroll if route.onScroll
    Weston.layout.$('#nav-menu').removeClass('active')

$(document).ready ->
  Weston.init()
