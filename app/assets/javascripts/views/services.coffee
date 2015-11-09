class Weston.Views.Services extends Backbone.View

  id: 'services-page'
  template: JST['services']

  render: ->
    @$el.html(@template())
    super
    $('header .services').addClass('selected').siblings().removeClass('selected')
    this
