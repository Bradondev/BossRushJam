extends CardEffect 
@export var  AmountOfCardSteal :int
signal Steal
func  UseEffect():
	emit_signal("Steal", AmountOfCardSteal)

