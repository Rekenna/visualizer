#
# This file is run on every page & initializes what's needed
#

window.App ||= {}

App.init = (e) ->

  console.log 'Visualizer Initialized'

  App.Songs.init()

  paper.install(window)

  App.Visualizer.init()

  return

# Initialize App on Page Ready
$(document).ready ->
  App.init()

  return

#
$('button#addMedia').on 'click', (e) ->
  url = $('#media').val()
  url = url.split('?v=')[1]
  App.Player.embed.loadVideoById(url)
  # App.Visualizer.init()
  return
