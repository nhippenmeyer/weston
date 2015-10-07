class Weston.Views.CategoriesGraphic extends Weston.Views.Category

  id: 'graphic-category'
  category: 'graphic'
  name: 'Graphic'
  subheaders: ['Graphic design', 'Branding', 'Marketing & advertising']

  navLeftRoute: -> '#architecture'
  navLeftPage: -> new Weston.Views.CategoriesArchitecture(pages: false)
