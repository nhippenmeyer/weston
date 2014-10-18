class Weston.Routers.Home extends Backbone.Router
  routes:
    '': 'home'

  home: ->
    @view = new Weston.Views.Home
    $('#page-region').html(@view.render().el)
    @onScroll()

  onScroll: =>
    if $('body').scrollTop() < @view.$('#page-2').offset().top
      $('header .menu').addClass('dark')
    else
      $('header .menu').removeClass('dark')
