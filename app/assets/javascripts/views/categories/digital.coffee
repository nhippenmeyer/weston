class Weston.Views.CategoriesDigital extends Weston.Views.Category

  id: 'digital-category'
  category: 'digital'
  name: 'Digital'
  subheaders: ['Website design & development', 'App design & development',
               'User experience & user interface design', 'Asset strategy & creation']

  navRightRoute: -> '#architecture'
  navRightPage: -> new Weston.Views.CategoriesArchitecture(pages: false)
