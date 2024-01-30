extends Node2D



signal StartEnemyTurn
signal StartThisUnitTurn
signal GiveWeaknessInfo
signal OnDraw(card)
@onready var CardHolder = $CardHolder
var Cards 
var PlayerCanUseCards = false
var CurrentCardsCycle
var CurrentCardCycleIndex
var LengthOfDeck
var NextCard
var DrawAmount = 0
@export var CurrentEnemy :Player
@export var CurrentPLayer: Boss

func _ready():
	emit_signal("GiveWeaknessInfo", CurrentEnemy,CurrentPLayer)
	Cards = $CardHolder.get_children()
	CurrentCardsCycle = Cards.duplicate(true)
	CurrentCardCycleIndex = CurrentCardsCycle.size() -1
	LengthOfDeck =Cards.size()
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
		NextCard = CurrentCardsCycle[CurrentCardCycleIndex]
		
		var Newcard = NextCard.duplicate()
		Newcard.global_position = $DeckArea.global_position
		Newcard.visible = true
		Newcard.CanBeUsed = PlayerCanUseCards
		Newcard.UsePoint = $UseArea.global_position
		Newcard.BossCard = true
		Newcard.add_to_group("BossCards")
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


func DrawCounters():
	CurrentCardCycleIndex -=1 
	DrawAmount += 1


func _on_end_combo_manager_draw_combo_break(Amount):
	DrawCards(Amount)
	
func StartBattle():
	DrawCards(5)
func StartTurn():
	DrawCards(3)
	emit_signal("StartThisUnitTurn")
func  EndTurn():
	PlayerCanUseCards = false
	var Cards = get_tree().get_nodes_in_group("Cards")
	for card  in Cards:
		card.CanBeUsed = false
	emit_signal("StartEnemyTurn")
	




func _on_button_pressed():
	DrawCards(5)


func _on_battle_manager_start_combo_battle():
	DrawCards(5)

