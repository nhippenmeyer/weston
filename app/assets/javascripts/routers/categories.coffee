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
    $('#page-region').html(@view.render().el)
    _.defer => $('#page-region > .category-page > .category-content .header-section').addClass('visible')
    $('header .menu').removeClass('dark')
