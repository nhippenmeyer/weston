class Weston.Views.CategoriesArchitecture extends Weston.Views.Category

  id: 'architecture-category'
  category: 'architecture'
  name: 'Architecture + </br> Interior Design'
  projectsTemplate: JST['categories/architecture_projects']

  navLeftRoute: '#website'
  navRightRoute: '#branding'
  navLeftPage: -> new Weston.Views.CategoriesWebsite(pages: false)
  navRightPage: -> new Weston.Views.CategoriesBranding(pages: false)

  quote: "Consider the momentous event in architecture when the wall parted and the column became."
  quoteAuthor: "Louis Kahn"
