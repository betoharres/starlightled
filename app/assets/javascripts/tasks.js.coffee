# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$('#attachable-select').hide()
$('#task_code').on 'change', ->
  if $('#task_code').val() == '100'
    $('#attachable-select').show()
    $('#task_attachable_id').empty()
    $('#task_attachable_id').append($('<option>', {value: '',text: 'Selecione uma Configuração'}))
    $.each $('#code-data').data('configFile'), (k, v) ->
      $('#task_attachable_id').append($('<option>', {value: v[1],text: v[0]}))
    $('#task_attachable_id').trigger("chosen:updated")
    $('#task_attachable_type').val('ConfigFile')
  else if $('#task_code').val() == '200'
    $('#attachable-select').show()
    $('#task_attachable_id').empty()
    $('#task_attachable_id').append($('<option>', {value: '',text: 'Selecione um Firmware'}))
    $.each $('#code-data').data('firmware'), (k, v) ->
      $('#task_attachable_id').append($('<option>', {value: v[1],text: v[0]}))
    $('#task_attachable_id').trigger("chosen:updated")
    $('#task_attachable_type').val('Firmware')
  else if $('#task_code').val() == '300'
    $('#attachable-select').show()
    $('#task_attachable_id').empty()
    $('#task_attachable_id').append($('<option>', {value: '',text: 'Selecione um Comando'}))
    $.each $('#code-data').data('command'), (k, v) ->
      $('#task_attachable_id').append($('<option>', {value: v[1],text: v[0]}))
    $('#task_attachable_id').trigger("chosen:updated")
    $('#task_attachable_type').val('Command')
  else
    $('#attachable-select').hide()
    $('#task_attachable_id').empty()
    $('#task_attachable_id').append($('<option>', {value: '',text: 'Selecione um Arquivo'}))
    $('#task_attachable_id').trigger("chosen:updated")
