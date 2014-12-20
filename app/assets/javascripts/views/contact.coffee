class Weston.Views.Contact extends Backbone.View

  id: 'contact-page'
  template: JST['contact']

  render: ->
    @$el.html(@template())
    this
