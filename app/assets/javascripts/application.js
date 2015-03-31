// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require dropzone
//= require turbolinks
//= require_tree .

jQuery(function() {
    $('body').prepend('<div id="fb-root"></div>');
    return $.ajax({
        url: window.location.protocol + "//connect.facebook.net/en_US/all.js",
        dataType: 'script',
        cache: true
    });
});

window.fbAsyncInit = function() {
    FB.init({
        appId: '1452812425010270',
        cookie: true
    });
    $('#sign_in').click(function(e) {
        e.preventDefault();
        return FB.login(function(response) {
            if (response.authResponse) {
                return window.location = '/auth/facebook/callback';
            }
        });
    });
    return $('#sign_out').click(function(e) {
        FB.getLoginStatus(function(response) {
            if (response.authResponse) {
                return FB.logout();
            }
        });
        return true;
    });
};



Dropzone.options.songDropzone = {
    paramName: "file",
    maxFilesize: 10,
    addRemoveLinks: true,
    init: function() {
        return this.on('removedfile', function(file) {
            if (file.xhr) {
                return $.ajax({
                    url: "" + ($("#song-dropzone").attr("action")) + "/" + (JSON.parse(file.xhr.response).id),
                    type: 'DELETE'
                });
            }
        });
    }
};