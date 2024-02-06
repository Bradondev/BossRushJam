extends Node2D





var CardsInPLay = []
var CardSpots
var OverDrawDamage = 1
var SpotsTaken = [false,false,false, false,false,false,false,false,false,false]
var OverDrawBuff = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	CardSpots = get_children()
	print()
	CardSpots.reverse()

# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_players_deck_on_draw(card):
	CardsInPLay.append(card)
	SpotsTaken.append(true) 
	if CardsInPLay.size() > CardSpots.size():
		CardsInPLay.remove_at(CardsInPLay.find(card))
		$"..".CurrentEnemy.TakeDamage(OverDrawDamage)
		print(card.Name + " Over Draw")
		card.drawSound()
		card.IsUsed = true
		return
	card.ConnectSignal("OnClick", self.CutCardFromCardInPlay)
	for effects in card.Effects:
		effects.ConnectSignal("DrawCard", $"..".DrawCards)
		effects.ConnectSignal("AttackBoss",$"..".CurrentEnemy.TakeDamage)
		effects.ConnectSignal("Recoil",$"..".CurrentPLayer.TakeDamage)
		effects.ConnectSignal("Steal",$"../StealCardBoss".StealCard)
		effects.ConnectSignal("Heal",$"..".CurrentPLayer.Heal)
		effects.ConnectSignal("Shield",$"..".CurrentPLayer.ShieldUpdate)
		effects.ConnectSignal("OverDrawBuff", OverDrawBuffUpdata)
		effects.ConnectSignal("Reflect",$"..".CurrentEnemy.TakeDamage)
	card.Draw(CardSpots[CardsInPLay.find(card)].global_position.x)
	




func CutCardFromCardInPlay(card):
	CardsInPLay.remove_at(CardsInPLay.find(card))
	SpotsTaken[CardsInPLay.find(card)] = false
	for Cards in CardsInPLay:
		print_debug("Cards move")
		Cards.Draw(CardSpots[CardsInPLay.find(Cards) ].global_position.x)
func UpdateHand():
	for Cards in CardsInPLay:
		print_debug("Cards move")
		Cards.Draw(CardSpots[CardsInPLay.find(Cards) ].global_position.x)
func  OverDrawBuffUpdata(Amount):
	OverDrawBuff += Amount
