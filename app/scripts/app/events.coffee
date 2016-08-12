App.Events =

	sendEvent: (e) =>
		# Actual Google Analytics Event Send
		ga 'send', 'event'
		return

	#/ App.Events
Events = App.Events


#
# Event Delegation
#

$(document).on 'click submit', '.send-ga-event', (e) ->
	Events.sendEvent()
	return
