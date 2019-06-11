$(document).on 'turbolinks:load', ->
  $('input.date-picker').datepicker().on 'change', ->
    $(this).datepicker('hide')
