class Weston.Views.Category extends Backbone.View

  className: 'category-page'

  layoutTemplate: JST['categories/layout']

  events:
    'click .nav-left' : 'navigateLeft'
    'click .nav-right': 'navigateRight'

  render: ->
    @$el.html(@layoutTemplate(category: @category))
    this

  navigateLeft: ->

  navigateRight: ->

