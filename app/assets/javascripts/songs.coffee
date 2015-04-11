# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('.best_in_place').best_in_place()

$(document).ready ->
  $(document).on( "ajax:beforeSend", "a[name='copysong']", (xhr, settings) ->
    $(this).removeClass("glyphicon-plus").addClass("glyphicon-refresh").attr('disabled','disabled')
  ).on("ajax:success", "a[name='copysong']", (e, data, status, xhr) ->
    $(this).removeClass("glyphicon-refresh").addClass("glyphicon-ok")
  ).on( "ajax:error", "a[name='copysong']", (e, xhr, status, error) ->
    alert("Error. Try again.") )

$(document).ready ->
  $(document).on("ajax:success", "a[name='deletesong']", (e, data, status, xhr) ->
    $("#deletesong" + data.song_id).remove()
  ).on "ajax:error", (e, xhr, status, error) ->
    alert("Error. Try again.")
