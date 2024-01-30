extends CardEffect 
@export var  AmountOfDeBuff :int
signal DeBuff
func  UseEffect():
	emit_signal("DeBuff", AmountOfDeBuff)

