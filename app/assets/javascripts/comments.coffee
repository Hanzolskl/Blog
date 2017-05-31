# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
   $(document).on 'click', '.save_edit', ->
      post_item = $('#post_id').val()
      comment_item = $(this).parent().find('#comment_id').val()
      comment_body = $(this).parent().find('.update_text').val()
      li_id = "#li-#{comment_item}"
      $.ajax
        type: 'PUT'
        url: "/posts/#{post_item}/comments/#{comment_item}"
        data: {comment: {body: comment_body} }
        dataType: 'json'
        success: (data) ->
          if comment_body != ""
            $(".list-group").find(li_id).find('.comment_body_div').html(comment_body)
            $(".list-group").find(li_id).find('.edit_form').hide()
            $(".list-group").find(li_id).find('.edit_form').find('.alert.alert-danger').remove()
          else
            $("<div class='alert alert-danger'> Body can't be blank </div>" ).insertAfter($(".list-group").find(li_id).find('.edit_form').find('.form-control.update_text'))
            $(".list-group").find(li_id).find('.edit_form').find('.alert.alert-danger').eq(1).remove()
        error: (data) ->
          $('body').text(data.responseText)
          debugger
   $(document).on 'click', '.save_new_comment', ->
    post_item = $('#post_id').val()
    comment_body =$('.form-control.save_comment').val()
    $.ajax
      type: 'POST'
      url: "/posts/#{post_item}/comments"
      data: {comment: {body: comment_body} }
      dataType: 'script'
