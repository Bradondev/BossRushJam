extends CardEffect 
signal Reflect
func  UseEffect():
	var CurrentUser = get_parent().get_parent().CurrentUser
	emit_signal("Reflect", CurrentUser.Shield)

