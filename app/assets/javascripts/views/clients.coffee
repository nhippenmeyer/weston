class Weston.Views.Clients extends Backbone.View

  id: 'clients-page'
  template: JST['clients']
  footerTemplate: JST['footer']

  render: ->
    @$el.html(@template())
    @$('.footer-container').html(@footerTemplate())
    $('header .clients').addClass('selected').siblings().removeClass('selected')
    this
