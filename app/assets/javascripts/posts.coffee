# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#$('document').on 'click', '.edit_comment', ->
#  $(this).parent().find('.edit_form').toggle 'slow'
#$ ->
#  $('.edit_comment').click ->
#    $(this).parent().find('.edit_form').toggle 'slow'
#$('document').ready ->
#  debugger
#  $('.edit_comment').click ->
#    $(this).parent().find('.edit_form').toggle 'slow'
$(document).on 'click', '.edit_comment', ->
  $(this).parent().find('.edit_form').toggle 'slow'
