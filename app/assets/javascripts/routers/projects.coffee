class Weston.Routers.Projects extends Backbone.Router
  routes:
    'projects/:project': 'project'

  project: (project) ->
    @view = new Weston.Views.Project(project: project)
    $('#page-region').html(@view.render().el)
    $('header .menu').removeClass('dark')
