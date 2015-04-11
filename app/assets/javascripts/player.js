
$(document).ready(function(){
    if ( $("#jquery_jplayer_1").length ){
        var songs = [];
        $.getJSON( window.location.pathname + ".json", function( data ) {
            var node;
            for( node in data) {
                var song = {};
                song.id = data[node].id;
                song.title = data[node].title;
                song.mp3 = data[node].file.url;
                song.artist = data[node].performer;
                song.free = true;
                songs.push( song );
            }
            var myPlaylist = new jPlayerPlaylist({
                jPlayer: "#jquery_jplayer_1",
                cssSelectorAncestor: "#jp_container_1"
            }, songs, {
                playlistOptions: {
                    enableRemoveControls: true
                },
                swfPath: "jquery.jplayer.swf",
                supplied: "oga, mp3",
                wmode: "window",
                useStateClassSkin: true,
                autoBlur: false,
                smoothPlayBar: true,
                keyEnabled: true
            });
        });
    }
});