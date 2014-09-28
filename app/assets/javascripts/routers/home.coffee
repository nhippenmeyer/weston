class Weston.Routers.Home extends Backbone.Router
  routes:
    '': 'home'

  home: ->
    view = new Weston.Views.Home
    $('body').html(view.render().el)
