class Weston.Routers.Home extends Backbone.Router
  routes:
    ''       : 'home'
    'about'  : 'about'
    'contact': 'contact'
    'work'   : 'work'

  home: ->
    @view = new Weston.Views.Home
    $('#page-region').html(@view.render().el)

  about: ->
    view = new Weston.Views.About
    $('#page-region').html(view.render().el)

  contact: ->
    view = new Weston.Views.Contact
    $('#page-region').html(view.render().el)

  work: ->
    @view = new Weston.Views.Home
    $('#page-region').html(@view.render().el)
    $('#page-content').scrollTop($("#page-2").offset().top)
