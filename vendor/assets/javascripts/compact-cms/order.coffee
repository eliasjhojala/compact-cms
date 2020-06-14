$(document).on 'turbolinks:load', ->
  $('article, figure').find('a.order-up, a.order-down').on 'ajax:success', (e) ->
    button = $(e.target)
    elementToBeMoved = button.closest('article, figure')
    if button.is '.order-up'
      elementToBeMoved.insertAfter elementToBeMoved.next()
    else if button.is '.order-down'
      elementToBeMoved.insertBefore elementToBeMoved.prev()
    button.get(0).scrollIntoView block: 'center'
