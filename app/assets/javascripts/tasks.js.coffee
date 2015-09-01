# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$('#task_code').on 'change', ->
  if $('#task_code').val() == '100'
    $('#config_files-form').show()
    $('#firmwares-form').hide()
  if $('#task_code').val() == '200'
    $('#firmwares-form').show()
    $('#config_files-form').hide()
