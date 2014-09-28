class Weston.Routers.Categories extends Backbone.Router
  routes:
    'website'     : 'website'
    'architecture': 'architecture'
    'branding'    : 'branding'

  website: ->
    @view = new Weston.Views.CategoriesWebsite
    @showView()

  architecture: ->
    @view = new Weston.Views.CategoriesArchitecture
    @showView()

  branding: ->
    @view = new Weston.Views.CategoriesBranding
    @showView()

  showView: ->
    $('#page-content').html(@view.render().el)
