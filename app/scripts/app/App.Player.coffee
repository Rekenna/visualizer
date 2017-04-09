App.Player =

  initPlayer: (e, id) ->
    P.embed = new YT.Player('player', {
      events: {
        'onReady': P.onPlayerReady
        'onStateChange': P.onPlayerStateChange
      }
    })
    return

  onPlayerReady: (e) ->
    console.log 'ready'
    e.target.playVideo()
    return

  onPlayerStateChange: (e) ->
    if (e.data == YT.PlayerState.PLAYING)
      console.log 'State changed'
    return

  stopPlayer: (e) ->
    P.embed.stopVideo()
    return

  #/ App.Songs

P = App.Player
