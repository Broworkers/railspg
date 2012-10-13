# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
$ ->
  $('div.chat').each ->
    console.log 'DEBUG: div.chat has been called'
    # Use AJAX to get last messages
    # Append last messages to the right container
