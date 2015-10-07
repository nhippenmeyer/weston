class Weston.Views.CategoriesArchitecture extends Weston.Views.Category

  id: 'architecture-category'
  category: 'architecture'
  name: 'Architecture'
  subheaders: ['Concept & schematic design', 'Interior design',
               'Masterplanning', 'Architectural visualization']

  navLeftRoute: -> '#digital'
  navRightRoute: -> '#graphic'
  navLeftPage: -> new Weston.Views.CategoriesDigital(pages: false)
  navRightPage: -> new Weston.Views.CategoriesGraphic(pages: false)
