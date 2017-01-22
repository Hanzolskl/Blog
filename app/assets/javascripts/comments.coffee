# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.save_edit').click ->
      post_id = $('#post_id').val()
      comment_id = $(this).parent().find('#comment_id').val()
      comment_body = $(this).parent().find('.update_text').val()
      li_id = "#li-#{comment_id}"
      $.ajax
        type: 'PUT'
        url: "/posts/#{post_id}/comments/#{comment_id}"
        data: {comment: {body: comment_body} }
        dataType: 'json'
        success: (data) ->
          $(".list-group").find(li_id).find('.comment_body_div').html(comment_body)
          debugger
          $(".list-group").find(li_id).find('.myClass').hide()
