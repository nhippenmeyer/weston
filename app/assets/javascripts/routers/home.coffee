class Weston.Routers.Home extends Backbone.Router
  routes:
    ''        : 'home'
    'contact' : 'contact'
    'work'    : 'work'
    'services': 'services'
    'clients' : 'clients'

  home: ->
    @view = new Weston.Views.Home
    $('#page-region').html(@view.render().el)

  contact: ->
    view = new Weston.Views.Contact
    $('#page-region').html(view.render().el)

  work: ->
    @view = new Weston.Views.Home
    $('#page-region').html(@view.render().el)
    $('#page-content').scrollTop($("#page-2").offset().top)

  services: ->
    view = new Weston.Views.Services
    $('#page-region').html(view.render().el)

  clients: ->
    view = new Weston.Views.Clients
    $('#page-region').html(view.render().el)
