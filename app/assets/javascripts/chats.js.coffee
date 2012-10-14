# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
$ ->
  $('div.chat div.content').each ->
    loadingTimeout = 500

    $.fn.loadMessages = ->
        $.ajax
          cache: false
          url: '/messages'
          success: (data) ->
            if data.length > 0
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

    commandHistory = ['/say ', '/ooc ']
    commandCursor = 0

    $.fn.commandTrigger = ->
      messageStack.push $(this).val()
      messageCursor = messageStack.length
      value = $(this).val()
      if value.match('^\/')
        value = value.split(' ')[0] + ' '
        $(this).val(value)
        if commandHistory[0] is ''
          commandHistory[0] = value
        else if commandHistory[0] isnt value
          commandHistory[0] = value
      else
        $(this).val ''

    $('form').submit ->
      $.ajax
        cache: false
        data: $(this).serialize()
        url: '/messages'
        type: 'post'
        success: ->
          $('input:text').commandTrigger()
        error: ->
          $('input:text').val ''
      false

    $('input:text').keydown (event) ->
      if event.keyCode is 9 # Tab
       # commandHistory[1] = $(this).val().split(' ')[0]
        $(this).val commandHistory[++commandCursor%2]
        return false

    $('input:text').keyup (event) ->
      if event.keyCode is 27
        $(this).val ''
        return false

      if messageStack.length > 0
        if event.keyCode is 38 # /\
          if messageCursor > 0
            messageCursor--
            $(this).val messageStack[messageCursor]
        else if event.keyCode is 40 # \/
          if messageCursor < messageStack.length
            messageCursor++
            $(this).val messageStack[messageCursor]
          else
            $(this).val ''

      return true
