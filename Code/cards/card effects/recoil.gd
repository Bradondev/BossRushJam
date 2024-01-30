extends CardEffect 
@export var  AmountOfRecoilDamage :int
signal Recoil
func  UseEffect():
	emit_signal("Recoil", AmountOfRecoilDamage)
	
