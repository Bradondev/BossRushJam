extends CardAttacks

@export var AmountOfCardDrawed :int


signal DrawCard
# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func OnUse():
	emit_signal("DrawCard", AmountOfCardDrawed)
