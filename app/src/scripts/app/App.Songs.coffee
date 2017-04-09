App.Songs =

  init: (e) ->
    S.player[0].volume = '0.01'

    return

  player: $('#audioElement')
  playingSong: $('#playingSong')

  changeSong: (song) ->
    S.player[0].pause()
    S.playingSong.attr 'src', song
    S.player[0].load()
    S.player[0].play()
    return

  #/ App.Songs

S = App.Songs


$(document).on 'click', 'ul.song-list a', (e) ->
  song = $(this).data 'song'
  S.changeSong song
  return
