class Weston.Views.Clients extends Backbone.View

  id: 'clients-page'
  template: JST['clients']

  render: ->
    @$el.html(@template())
    super
    $('header .clients').addClass('selected').siblings().removeClass('selected')
    this
