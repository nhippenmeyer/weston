class Weston.Views.Contact extends Backbone.View

  id: 'contact-page'
  template: JST['contact']
  footerTemplate: JST['footer']

  render: ->
    super
    @$el.html(@template())
    @$('.footer-container').html(@footerTemplate())
    $('header .contact').addClass('selected').siblings().removeClass('selected')
    this
