class Weston.Routers.Categories extends Backbone.Router
  routes:
    'website'     : 'website'
    'architecture': 'architecture'
    'branding'    : 'branding'

  website: ->
    view = new Weston.Views.CategoriesWebsite
    $('body').html(view.render().el)

  architecture: ->
    view = new Weston.Views.CategoriesArchitecture
    $('body').html(view.render().el)

  branding: ->
    view = new Weston.Views.CategoriesBranding
    $('body').html(view.render().el)
