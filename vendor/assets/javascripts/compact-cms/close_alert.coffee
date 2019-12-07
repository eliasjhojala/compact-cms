$(document).ready ->
  $(window).on 'beforeunload', ->
    if false && $('.site-content-elements form').length > 0 # Todo: prevent firing on form submission
      return ''
