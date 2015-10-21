class Weston.Views.Services extends Backbone.View

  id: 'services-page'
  template: JST['services']
  footerTemplate: JST['footer']

  render: ->
    super
    @$el.html(@template())
    @$('.footer-container').html(@footerTemplate())
    $('header .services').addClass('selected').siblings().removeClass('selected')
    this
