App.Forms =

	formatPhone: (field) ->
		x = field.value.replace(/\D/g, '').match(/(\d{0,3})(\d{0,3})(\d{0,4})/)
		return field.value = if !x[2] then x[1] else '(' + x[1] + ') ' + x[2] + (if x[3] then '-' + x[3] else '')

	#/ App.Forms
Forms = App.Forms


#
# Event Delegation
#

$(document).on 'input', 'input.phone-mask', (e) ->
  return Forms.formatPhone(e.target)
