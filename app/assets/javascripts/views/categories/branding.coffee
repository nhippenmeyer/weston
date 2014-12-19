class Weston.Views.CategoriesBranding extends Weston.Views.Category

  id: 'branding-category'
  category: 'branding'
  name: 'Branding + </br> Graphic Design'
  projectsTemplate: JST['categories/branding_projects']

  navLeftRoute: -> '#architecture'
  navLeftPage: -> new Weston.Views.CategoriesArchitecture(pages: false)

  quote: "When Aeschines spoke, they said, ‘How well he speaks.’ But when Demosthenes spoke, they said, ‘Let us march against Philip.'"
  quoteAuthor: "David Ogilvy"
