class Weston.Views.CategoriesWebsite extends Weston.Views.Category

  id: 'website-category'
  category: 'website'
  name: 'Website + </br> App Design'

  navRightRoute: -> '#architecture'
  navRightPage: -> new Weston.Views.CategoriesArchitecture(pages: false)
