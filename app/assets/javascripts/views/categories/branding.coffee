class Weston.Views.CategoriesBranding extends Weston.Views.Category

  id: 'branding-category'
  category: 'branding'
  name: 'Branding + </br> Graphic Design'

  navLeftRoute: -> '#architecture'
  navLeftPage: -> new Weston.Views.CategoriesArchitecture(pages: false)
