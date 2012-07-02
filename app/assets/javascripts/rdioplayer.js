var duration = 1; // track the duration of the currently playing track
  $(document).ready(function() {
    var i=0
    var rdio;
    var tracks;

    $('#api').bind('ready.rdio', function() {
      rdio    = $(this).rdio();
      tracks  = $('#tracks').data('tracks');

      rdio.play(tracks[i]['rdio_id']);
      $('span#artist').text(tracks[i]['artist']);
      $('span#track').text(tracks[i]['title']);

      $('#previous').click(function() { 
        rdio.play(tracks[i-1]['rdio_id']);
        i = i - 1;
        $('span#artist').text(tracks[i]['artist']);
        $('span#track').text(tracks[i]['title']);
      });

      $('#next').click(function() {
        rdio.play(tracks[i+1]['rdio_id']);
        i = i + 1;
        $('span#artist').text(tracks[i]['artist']);
        $('span#track').text(tracks[i]['title']);
      });

    });
    $('#api').bind('playStateChanged.rdio', function(e, playState) {
      if (playState == 0) { // paused
        $('#play').show();
        $('#pause').hide();
      } else {
        $('#play').hide();
        $('#pause').show();
      }
    });
    // for localhost
    $('#api').rdio('GAlNi78J_____zlyYWs5ZG02N2pkaHlhcWsyOWJtYjkyN2xvY2FsaG9zdEbwl7EHvbylWSWFWYMZwfc=');
    // for rdtrip.in
    //$('#api').rdio('GAlNi78J_____zlyYWs5ZG02N2pkaHlhcWsyOWJtYjkyN2xvY2FsaG9zdEbwl7EHvbylWSWFWYMZwfc=');

    $('#play').click(function() { $('#api').rdio().play(); });
    $('#pause').click(function() { $('#api').rdio().pause(); });
    $('.lastfm-link').click(function() { $('#api').rdio().pause(); });
  });