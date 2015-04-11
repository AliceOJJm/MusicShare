
var app = function() {

    Dropzone.options.songDropzone = {
        paramName: "file",
        maxFilesize: 10,
        addRemoveLinks: true,
        dictDefaultMessage: "Drop music here to upload",
        dictInvalidFileType: "Invalid type, only(mp3)",
        init: function () {
            this.on('removedfile', function (file) {
                if (file.xhr) {
                    return $.ajax({
                        url: "" + ($("#song-dropzone").attr("action")) + "/" + (JSON.parse(file.xhr.response).id),
                        type: 'DELETE'
                    });
                }
            });
            this.on("queuecomplete", function (file) {
                $('#mysongs').load(document.URL +  ' #mysongs');
                $('div.dz-success').remove();
            });
        }
    };
};

$(document).on("page:load", app );
$(document).ready(app);