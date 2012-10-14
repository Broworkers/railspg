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
      if $('.auto-scroll input').is(':checked')
       $(this)[0].scrollTop = 9999999

    $.fn.loadMessages()

    messageStack = new Array()
    messageCursor = 0

    commands = ['/say', '/ooc']
    commandCursor = 0

    $('form').submit ->
      messageStack.push $('input').val()
      $('input').val ''
      messageCursor = messageStack.length
      commandCursor = 0
      false

    $('form fieldset input').keydown (event) ->
      if event.keyCode is 9 # Tab
        $('input').val commands[commandCursor++ % 2] + ' '
        return false

      if messageStack.length > 0
        if event.keyCode is 38 # /\
          messageCursor = (messageCursor - 1) % messageStack.length
          $('input').val messageStack[messageCursor]
        else if event.keyCode is 40 # \/
          messageCursor = (messageCursor + 1) % messageStack.length
          $('input').val messageStack[messageCursor]

      true
