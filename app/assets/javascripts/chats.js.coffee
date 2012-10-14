# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
$ ->
  $('div.chat div.content').each ->
    loadingTimeout = 3000

    $.fn.loadMessages = ->
        $.ajax
          cache: false
          url: '/messages'
          success: (data) ->
            $('div.chat div.content').append data
            $('div.content').scroll()
            window.setTimeout $.fn.loadMessages, loadingTimeout
            loadingTimeout = 3000
          error: ->
            window.setTimeout $.fn.loadMessages, (loadingTimeout += 3000)

    $.fn.scroll = ->
      if $('#auto-scroll').is(':checked')
       $(this)[0].scrollTop = 9999999

    $.fn.loadMessages()

    messageStack = new Array()
    cursor = 0

    $('form').submit ->
      messageStack.push $('input').val()
      $('input').val ''
      cursor = messageStack.length
      false

    $('form fieldset input').keypress (event) ->
      if messageStack.length > 0
        if event.keyCode == 38 # /\
          cursor = (cursor - 1) % messageStack.length
          $('input').val messageStack[cursor]
        if event.keyCode == 40 # \/
          cursor = (cursor + 1) % messageStack.length
          $('input').val messageStack[cursor]
      true

    # Use AJAX to get last messages
    # Append last messages to the right container
