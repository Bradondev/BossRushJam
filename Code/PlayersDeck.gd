extends Node2D

signal StartEnemyTurn
signal StartPlayerTurn
signal GiveWeaknessInfo
signal OnDraw(card)
@onready var CardHolder = $CardHolder
var Cards 
var PlayerCanUseCards 
var CurrentCardsCycle 
var CurrentCardCycleIndex
var LengthOfDeck
var NextCard
var DrawAmount = 0
@export var CurrentEnemy :Boss
@export var CurrentPLayer: Player

func _ready():
	if CurrentEnemy == null:
		CurrentEnemy =  get_tree().get_nodes_in_group("boss")[0]
	if CurrentPLayer == null:
		print("foundPlayer")
		CurrentPLayer =  get_tree().get_nodes_in_group("player")[0]
	emit_signal("GiveWeaknessInfo", CurrentEnemy,CurrentPLayer)
	Cards = $CardHolder.get_children()
	CurrentCardsCycle = Cards.duplicate(true)
	CurrentCardCycleIndex = CurrentCardsCycle.size() -1
	LengthOfDeck =Cards.size()
	CurrentPLayer.UpdateLabels()
	print(CurrentCardsCycle)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func  _process(delta):
	$DeckAmount.text = str(CurrentCardCycleIndex +1 )



func ReSetDeck():
	CurrentCardsCycle = Cards
	
	
func DrawCards(AmountOfCards):
	while AmountOfCards > 0:
		if CurrentCardCycleIndex < 0:
			print("reset")
			CurrentCardCycleIndex = CurrentCardsCycle.size() -1
		#if Cards.size() -1 < DrawAmount:
		print_debug(CurrentCardCycleIndex)
		NextCard = CurrentCardsCycle[CurrentCardCycleIndex]
		print_debug(NextCard)
		var Newcard = NextCard.duplicate()
		Newcard.global_position = $DeckArea.global_position
		Newcard.visible = true
		Newcard.CurrentUser = CurrentPLayer
		Newcard.CanBeUsed = PlayerCanUseCards
		Newcard.UsePoint = $UseArea.global_position
		Newcard.add_to_group("PlayerCards")
		$CardsInHandHolder.add_child(Newcard)
		emit_signal("OnDraw", Newcard)
		DrawCounters()
		AmountOfCards-= 1
		await get_tree().create_timer(.10).timeout

		#else:
			#NextCard = CurrentCardsCycle[CurrentCardCycleIndex]
			#CurrentCardCycleIndex -=1 
			#AmountOfCards-= 1
			#emit_signal("OnDraw", NextCard)
			#DrawAmount += 1
			#await get_tree().create_timer(.10).timeout
			
func _on_button_pressed():
	
	DrawCards(5)


func DrawCounters():
	CurrentCardCycleIndex -=1 
	DrawAmount += 1


func _on_end_combo_manager_draw_combo_break(Amount):
	DrawCards(Amount)
	
	
func StartTurn():
	DrawCards(5)
	PlayerCanUseCards = true
	var CardsInPlay = get_tree().get_nodes_in_group("Cards")
	for card  in CardsInPlay:
		card.CanBeUsed = true
	emit_signal("StartPlayerTurn")
func  EndTurn():
	PlayerCanUseCards = false
	var CardsInPlay = get_tree().get_nodes_in_group("Cards")
	for card  in CardsInPlay:
		card.CanBeUsed = false
	emit_signal("StartEnemyTurn")
func ReloadInfo():
	Cards = $CardHolder.get_children()
	CurrentCardsCycle = Cards.duplicate(true)
	CurrentCardCycleIndex = CurrentCardsCycle.size() -1
	LengthOfDeck =Cards.size()
	print(CurrentCardsCycle)

