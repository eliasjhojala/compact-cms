$(document).on 'turbolinks:load', ->
  if $('.site-content-elements').length > 0
    $('.site-content-elements article:not(.image_gallery) .edit-button').on 'click', (e) ->
      if $('.site-content-elements form').length == 0 || confirm('Another form open, continue?')
        if $(this).parents('article').data('formUrl') != ''
          $(this).parents('article').load($(this).parents('article').data('formUrl'))
          
    $('.site-content-elements article figure .edit-button').on 'click', (e) ->
      if $('.site-content-elements form').length == 0 || confirm('Another form open, continue?')
        if $(this).parents('figure').data('formUrl') != ''
          $(this).parents('figure').load($(this).parents('figure').data('formUrl'))
