extends CardEffect 
@export var  AmountOfCardDrawed :int
signal Heal
func  UseEffect():
	emit_signal("Heal", AmountOfCardDrawed)

