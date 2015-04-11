# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $(document).on('ajax:success', 'a[name=\'folder\']', (e, data, status, xhr) ->
    $('#LatestLink').removeClass('active')
    $('#SongsLink').removeClass('active')
    $('#PlaylistsLink').removeClass('active')
    $('#UsersLink').removeClass('active')
    $('#Latest').addClass('disp')
    $('#Playlists').addClass('disp')
    $('#Songs').addClass('disp')
    $('#Users').addClass('disp')
    $('#'+data.g_folder+'Link').addClass('active')
    $('#'+data.g_folder).removeClass('disp')
  ).on 'ajax:error', (e, xhr, status, error) ->
    alert 'Error. Try again.'