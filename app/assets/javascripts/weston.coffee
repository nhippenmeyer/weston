window.Weston =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}

  init: ->
    new Weston.Routers.Home
    new Weston.Routers.Categories
    Backbone.history.start()

$(document).ready ->
  Weston.init()
