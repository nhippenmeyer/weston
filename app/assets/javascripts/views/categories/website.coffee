class Weston.Views.CategoriesWebsite extends Weston.Views.Category

  id: 'website-category'
  category: 'website'
  name: 'Website + </br> App Design'
  projectsTemplate: JST['categories/website_projects']

  navRightRoute: '#architecture'
  navRightPage: -> new Weston.Views.CategoriesArchitecture(pages: false)

  quote: "Influence is not influence. It's simply someone's idea going through my new mind."
  quoteAuthor: "Jean-Michel Basquiat"
