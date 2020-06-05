$(document).on 'turbolinks:load', ->
  if $('#new-site-content-template').length > 0
    scope = $('.site-content-elements')
    scope.append($('#new-site-content-template').html())
    scope.find('.add .button').click ->
      if $('.site-content-elements form').length == 0 || confirm('Another form open, continue?')
        if $(this).closest('figure').length > 0
          $(this).closest('figure').load($(this).data('url'))
        else
          $(this).closest('.new-site-content').replaceWith($('#site-content-type-selection-template').html())
          scope = $('.site-content-elements').find('.site-content-type-selection .add, .add')
          scope.find('.image-button, .text-button').on 'click', (e) ->
            $(this).closest('article').load($(this).data('url'))
