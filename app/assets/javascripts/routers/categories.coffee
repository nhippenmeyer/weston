class Weston.Routers.Categories extends Backbone.Router
  routes:
    'digital'     : 'digital'
    'architecture': 'architecture'
    'graphic'     : 'graphic'

  digital: ->
    @view = new Weston.Views.CategoriesDigital
    @showView()

  architecture: ->
    @view = new Weston.Views.CategoriesArchitecture
    @showView()

  graphic: ->
    @view = new Weston.Views.CategoriesGraphic
    @showView()

  showView: ->
    $('#page-region').html(@view.render().el)
