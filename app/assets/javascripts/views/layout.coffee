class Weston.Views.Layout extends Backbone.View

  id: 'page-layout'

  template: JST['layout']

  events:
    'click .show-menu': 'showMenu'
    'click'           : 'onClick'

  render: ->
    @$el.html(@template())
    this

  showMenu: (e) ->
    e.preventDefault()
    e.stopPropagation()
    @$('#page-wrap').addClass('nav-active')

  onClick: (e) ->
    $el = @$('#nav-menu')
    if !$el.is(e.target) and $el.has(e.target).length is 0
      @$('#page-wrap').removeClass('nav-active')
