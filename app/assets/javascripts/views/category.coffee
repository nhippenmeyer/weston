class Weston.Views.Category extends Backbone.View

  className: 'category-page'

  layoutTemplate: JST['categories/layout']

  render: ->
    @$el.html(@layoutTemplate(category: @category))
    this
