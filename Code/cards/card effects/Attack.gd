extends CardEffect 
@export var  AmountOfDamage:int
signal AttackBoss
func  UseEffect():
	emit_signal("AttackBoss", AmountOfDamage)

