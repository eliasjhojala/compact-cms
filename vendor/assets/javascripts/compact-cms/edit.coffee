$(document).on 'turbolinks:load', ->
  if $('.site-content-elements').length > 0
    $('.site-content-elements article:not(.image_gallery) .edit-button').on 'click', (e) ->
      if $(this).closest('article').data('formUrl') != ''
        $(this).closest('article').load($(this).closest('article').data('formUrl'))
          
    $('.site-content-elements article figure .edit-button').on 'click', (e) ->
      if $(this).closest('figure').data('formUrl') != ''
        $(this).closest('figure').load($(this).closest('figure').data('formUrl'))
