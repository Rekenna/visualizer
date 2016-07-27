#
# This file is run on every page & initializes what's needed
#

window.App ||= {}

App.init = (e) ->

	App.Events.sendEvent()

	return



# Initialize App on Page Ready
$(document).ready =>
	App.init()
	return
