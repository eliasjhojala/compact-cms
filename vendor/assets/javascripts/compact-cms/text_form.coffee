$(document).on 'turbolinks:load', ->
  if $('form.site-content-text-form').length > 0
    if $('form.site-content-text-form textarea').data('editable') != ''
      $('form.site-content-text-form textarea').on 'input', ->
        elem = this
        $($('form.site-content-text-form textarea').data('editable')).html($(elem).val())
          
