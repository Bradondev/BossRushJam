extends Node2D



signal OnDraw(card)
@onready var CardHolder = $CardHolder
var Cards 
var CurrentCardsCycle
var CurrentCardCycleIndex
var LengthOfDeck
var NextCard
var DrawAmount = 0


func _ready():
	
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
