class Weston.Views.CategoriesBranding extends Weston.Views.Category

  id: 'branding-category'
  category: 'branding'
  name: 'Branding + </br> Graphic Design'
  template: JST['categories/branding']

  navLeftRoute: '#architecture'
  navLeftPage: -> new Weston.Views.CategoriesArchitecture(pages: false)
