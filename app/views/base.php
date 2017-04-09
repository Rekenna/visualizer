<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Landing Page Redux</title>

    <!-- Place favicon.ico in the root directory -->
		<link rel="icon" type="image/x-icon" href="./dist/favicon.ico" />

    <link rel="stylesheet" href="./dist/styles/vendor.css">
    <link rel="stylesheet" href="./dist/styles/styles.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">

    <link href="https://fonts.googleapis.com/css?family=Hind|Montserrat:200,400|Comfortaa" rel="stylesheet">

  </head>
  <body>


    <canvas id="visualizer" resize></canvas>

  <div class="audio-controls">
    <audio volume=.1 id="audioElement" controls="controls">
				Your browser does not support the
				<code>audio</code>
				element.
				<source  id="playingSong" src="./songs/Arque- Calling You Home (Ft. Emily Bodley).mp3" type="audio/wav">
			</audio>
  </div>

  <div class="site-content">
    <div class="container">
      <div class="col-md-6">
        <div class="card">
          <div class="embed-responsive embed-responsive-16by9">
            <div id="player"></div>
          </div>
        </div>
        <div class="card card-block">
          <form>
            <div class="form-group">
              <label for="media">Youtube Link</label>
              <input type="text" class="form-control" id="media" placeholder="youtube url" value="https://www.youtube.com/watch?v=wNwY8JCBm6o">
            </div>
            <button type="button" id="addMedia" name="button">Play</button>
          </form>
        </div>
      </div>
      <div class="col-md-6">
        <div class="card card-block">
          <ul class="song-list">
            <li>
              <a href="#0" data-song="./songs/Arque- Calling You Home (Ft. Emily Bodley).mp3" class="btn btn-primary">Calling You Home</a>
            </li>
            <li>
              <a href="#0" data-song="./songs/Arque- Could Have Been Giants.mp3" class="btn btn-danger">Could have been Giants</a>
            </li>
            <li>
              <a href="#0" data-song="./songs/Arque- Empires.mp3" class="btn btn-warning">Empires</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>

  <!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
  <script>
    (function(b, o, i, l, e, r) {
      b.GoogleAnalyticsObject = l;
      b[l] || (b[l] = function() {
        (b[l].q = b[l].q || []).push(arguments)
      });
      b[l].l = +new Date;
      e = o.createElement(i);
      r = o.getElementsByTagName(i)[0];
      e.src = 'https://www.google-analytics.com/analytics.js';
      r.parentNode.insertBefore(e, r)
    }(window, document, 'script', 'ga'));
    ga('create', 'UA-XXXXX-X');
    ga('send', 'pageview');
  </script>


  <!-- iframe Initialize -->
  <script>
    var tag = document.createElement('script');

    tag.src = "https://www.youtube.com/iframe_api";
    var firstScriptTag = document.getElementsByTagName('script')[0];
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

    function onYouTubeIframeAPIReady() {
      App.Player.initPlayer()
    }
  </script>


    <!-- Build Stuff -->
    <script src="./dist/scripts/vendor.js"></script>
    <script src="./dist/scripts/app.js"></script>

    <!-- build:js scripts/vendor.js -->
    <!-- bower:js -->
    <script src="/bower_components/jquery/dist/jquery.js"></script>
    <script src="/bower_components/modernizr/modernizr.js"></script>
    <script src="/bower_components/tether/dist/js/tether.js"></script>
    <script src="/bower_components/bootstrap/dist/js/bootstrap.js"></script>
    <!-- endbower -->
    <!-- endbuild -->

  </body>
</html>
