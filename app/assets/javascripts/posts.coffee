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
$(document).ready ->
  average_rating_post = $('#rate').val()
  progress = average_rating_post*$('.stars').width()/5
  rating = progress * 5 / $('.stars').width()
  $('#param1').text rating.toFixed(1)
  $('.stars').next().width progress
  fix = (e) ->
    progress = average_rating_post*$('.stars').width()/5
    rating = progress * 5 / $('.stars').width()
    $('#param1').text rating.toFixed(1)
    $('.stars').next().width progress
  move = (e, obj) ->
    id = obj.next().attr('id').substr(1)
    progress = e.pageX - (obj.offset().left)
    rating = progress * 5 / $('.stars').width()
    $('#param' + id).text rating.toFixed(1)
    obj.next().width progress
    return

  $('#rating .stars').click (e) ->
    user_item = $('#user_id').val()
    current_user_item = $('#current_user').val()
    if user_item != current_user_item
      $(this).toggleClass 'fixed'
      move e, $(this)
      post_item = $('#post_id').val()
      raite_value = parseFloat($('#param1').text())
      $.ajax
        type: 'POST'
        url: "/posts/#{post_item}/raites"
        data: {raite: {value: raite_value} }
        dataType: 'json'
      return
  $('#rating .stars').on 'mousemove', (e) ->
    if $(this).hasClass('fixed') == false
      move e, $(this)
    return
    return
  $('#rating .stars').on 'mouseout', (e) ->
    if $(this).hasClass('fixed') == false
      fix e

  return
