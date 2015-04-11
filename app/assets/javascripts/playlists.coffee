# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('.best_in_place').best_in_place()

$(document).ready ->
  $(document).on("ajax:success", "a[name='likelink']", (e, data, status, xhr) ->
    $("#" + data.playlist_id ).html("" + data.like_count)
    $("#" + data.playlist_id).toggleClass("liked")
  ).on "ajax:error", (e, xhr, status, error) ->
    $("#" + data.playlist_id).html ""


$(document).ready ->
  $(document).on("ajax:success", "a[name='deleteplaylist']", (e, data, status, xhr) ->
    $("#deleteplaylist" + data.playlist_id).remove()
  ).on "ajax:error", (e, xhr, status, error) ->
    alert("Error. Try again.")

$(document).ready ->
  $(document).on("ajax:success", "a[name='addsong']", (e, data, status, xhr) ->
   $("#addsong" + data.song_id).removeClass("glyphicon-plus").addClass("glyphicon-ok").attr("disabled", true)
  ).on "ajax:error", (e, xhr, status, error) ->
    alert("Error. Try again.")

