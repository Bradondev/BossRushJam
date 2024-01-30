extends CardEffect 
@export var  AmountOfShield :int
signal Shield
func  UseEffect():
	emit_signal("Shield", AmountOfShield)

