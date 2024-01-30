extends CardEffect 
@export var  AmountOfBuff :int
signal ComboBreakBuff
func  UseEffect():
	emit_signal("ComboBreakBuff", AmountOfBuff)

