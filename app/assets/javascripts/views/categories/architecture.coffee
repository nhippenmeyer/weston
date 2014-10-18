class Weston.Views.CategoriesArchitecture extends Weston.Views.Category

  id: 'architecture-category'
  category: 'architecture'
  name: 'Architecture + </br> Interior Design'
  projectsTemplate: JST['categories/architecture_projects']

  navLeftRoute: '#website'
  navRightRoute: '#branding'
  navLeftPage: -> new Weston.Views.CategoriesWebsite(pages: false)
  navRightPage: -> new Weston.Views.CategoriesBranding(pages: false)
