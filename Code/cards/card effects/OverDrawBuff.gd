extends CardEffect 
@export var  AmountOfCardDrawed :int
signal OverDrawBuff
func  UseEffect():
	emit_signal("OverDrawBuff", AmountOfCardDrawed)

