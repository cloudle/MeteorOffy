Wings.defineWidget 'applicationLayout',
  rendered: ->
    resizeAction()
    $(window).resize -> resizeAction()

resizeAction = ->
  Wings.Component.arrangeLayout()
