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

    commandList = ['/say', '/ooc', '/tell', '/w']
    commandHistory = ['', '']
    commandCursor = 0

    $.fn.commandTrigger = ->
      messageStack.push $(this).val()
      messageCursor = messageStack.length
      value = $(this).val()
      if value.match('^\/')
        command = value.split(' ')[0]
        if $.inArray(command, commandList) isnt -1
          $(this).val(command + ' ')
          if commandHistory[0] isnt command 
            commandHistory[1] = commandHistory[0]
            commandHistory[0] = command
        else
          $(this).val ''
      else
        $(this).val ''

    $('form').submit ->
      $.ajax
        cache: false
        data: $(this).serialize()
        url: '/messages'
        type: 'post'
        success: (data) ->
          $('div.chat div.content').append data
          $('div.content').scroll()
          $('input:text').commandTrigger()
        error: ->
          $('input:text').val ''
      console.log commandHistory
      return false

    $('input:text').keydown (event) ->
      if event.keyCode is 9 # Tab
        commandCursor = (commandCursor + 1) % 2
        value = $(this).val()
        if value.match '^\/'
          message = value.split(' ', 2)[1]
          if commandHistory[commandCursor] isnt ''
            $(this).val commandHistory[commandCursor] + ' ' + message
          else
            $(this).val message
          event.preventDefault()
        return false
      if messageStack.length > 0
        if event.keyCode is 38 # /\
          if messageCursor > 0
            messageCursor--
            $(this).val messageStack[messageCursor]
            event.preventDefault()
        else if event.keyCode is 40 # \/
          if messageCursor < messageStack.length
            messageCursor++
            $(this).val messageStack[messageCursor]
            event.preventDefault()
          else
            $(this).val ''
      return true

    $('input:text').keyup (event) ->
      if event.keyCode is 27
        $(this).val ''
        event.preventDefault()
        return false
      return true
