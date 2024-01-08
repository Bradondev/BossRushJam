extends Node2D





var CardsInPLay = []
var CardSpots
var SpotsTaken = [false,false,false, false,false,false,false,false,false,false]
# Called when the node enters the scene tree for the first time.
func _ready():
	CardSpots = get_children()
	print()
	CardSpots.reverse()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_players_deck_on_draw(card):
	CardsInPLay.append(card)
	SpotsTaken.append(true) 
	if CardsInPLay.size() > CardSpots.size():
		CardsInPLay.remove_at(CardsInPLay.find(card))
		print(card.Name + " was not able to be draw becasue hand is full")
		return
	card.OnClick.connect(CutCardFromCardInPlay)
	card.Draw(CardSpots[CardsInPLay.find(card)].global_position.x)
func RelineUpHand():
	pass

func CutCardFromCardInPlay(card):
	CardsInPLay.remove_at(CardsInPLay.find(card))
	SpotsTaken[CardsInPLay.find(card)] = false
	for Cards in CardsInPLay:
		Cards.Draw(CardSpots[CardsInPLay.find(Cards) ].global_position.x)
