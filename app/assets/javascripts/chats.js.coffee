# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
$ ->
  $('div.chat .content').each ->
    $.fn.loadMessages = ->
        $.ajax
          cache: false
          url: '/messages'
          beforeSend: ->
          success: (data) ->
            $('div.chat .content').append data
            window.setTimeout $.fn.loadMessages, 3000
          error: ->
            #alert 'erro'
    $.fn.loadMessages()
    # Use AJAX to get last messages
    # Append last messages to the right container
