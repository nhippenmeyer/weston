class Weston.Views.About extends Backbone.View

  id: 'about-page'
  template: JST['about']

  render: ->
    @$el.html(@template())
    this
