extends CardEffect 
@export var  AmountOfCardDrawed :int
signal DrawCard
func  UseEffect():
	emit_signal("DrawCard", AmountOfCardDrawed)

