# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# ajaxFileUpload = ->
#   $("#loading").ajaxStart( ->
#     $(this).show()
#   ).ajaxComplete( ->
#     $(this).hide()
#   )

($ "a[data-toggle=modal]").click ->
  target = ($ @).attr('data-image-url')
  image = $('<img/>').attr('src', target)
  screenHeight = screen.height
  maxHeight = screenHeight - 250
  $('#imageModal').html(image).css('max-height', maxHeight + 'px')