# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
$ ->
  $('div.chat').each ->
    loadingTimeout = 3000

    $.fn.loadMessages = ->
        $.ajax
          cache: false
          url: '/messages'
          success: (data) ->
            $('div.chat div.content').append data
            window.setTimeout $.fn.loadMessages, loadingTimeout
            loadingTimeout = 3000
            $('div.line').last().scroll()
          error: ->
            window.setTimeout $.fn.loadMessages, (loadingTimeout += 3000)

    $.fn.scroll = ->
      lastMessage = $(this)
      $('html, body').animate({ scrollTop: lastMessage.offset().top }, 2000);

    $.fn.loadMessages()
    # Use AJAX to get last messages
    # Append last messages to the right container
