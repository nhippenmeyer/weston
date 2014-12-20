class Weston.Routers.Home extends Backbone.Router
  routes:
    ''       : 'home'
    'about'  : 'about'
    'contact': 'contact'
    'work'   : 'work'

  home: ->
    @view = new Weston.Views.Home
    $('#page-region').html(@view.render().el)
    $('header .menu').removeClass('dark')
    @onScroll()

  about: ->
    view = new Weston.Views.About
    $('#page-region').html(view.render().el)
    $('header .menu').addClass('dark')

  contact: ->
    view = new Weston.Views.Contact
    $('#page-region').html(view.render().el)
    $('header .menu').addClass('dark')

  work: ->
    @view = new Weston.Views.Home
    $('#page-region').html(@view.render().el)
    $('header .menu').removeClass('dark')
    $('#page-content').scrollTop($(window).height())

  onScroll: =>
    if $('body').scrollTop() < @view.$('#page-2').offset().top
      $('header .menu').addClass('dark')
    else
      $('header .menu').removeClass('dark')
