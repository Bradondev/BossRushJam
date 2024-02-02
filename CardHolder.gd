extends Node2D

# Called when the node enters the scene tree for the first time.
func AddCards(CardList):
	for card in CardList:
		var Newcard = card.duplicate()
		Newcard.global_position = global_position
		self.add_child(Newcard)

