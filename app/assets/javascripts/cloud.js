/**
 * Created by lol on 5.4.15.
 */

$(document).ready(function() {
    if(!$('#myCanvas').tagcanvas({
            shape: "vring(0.9)",
            offsetY: -30,
            lock: "y",
            textColour: '#000000',
            outlineColour: '#77CCDD',
            reverse: true,
            depth: 0.8,
            maxSpeed: 0.05

        },'tags')) {
        $('#myCanvasContainer').hide();
    }
});