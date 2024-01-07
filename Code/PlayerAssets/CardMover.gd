extends Node2D





var CardsInPLay = []
var CardSpots
var SpotsTaken = [false,false,false, false,false,false,false]
# Called when the node enters the scene tree for the first time.
func _ready():
	CardSpots = get_children()
	CardSpots.reverse()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_players_deck_on_draw(card):
	CardsInPLay.append(card)
	SpotsTaken[CardsInPLay.find(card)] = true
	card.Draw(CardSpots[CardsInPLay.find(card)].position.x)
