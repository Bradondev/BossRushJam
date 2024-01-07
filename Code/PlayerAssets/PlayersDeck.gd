extends Node2D



signal OnDraw(card)
@onready var CardHolder = $CardHolder
var Cards 
var CurrentCardsCycle
var LengthOfDeck
var NextCard

func _ready():
	
	Cards = $CardHolder.get_children()
	CurrentCardsCycle = $CardHolder.get_children()
	LengthOfDeck =Cards.size()
	print(CurrentCardsCycle)
# Called every frame. 'delta' is the elapsed time since the previous frame.


func ReSetDeck():
	CurrentCardsCycle = Cards
	
	
func DrawCards(AmountOfCards):
	while AmountOfCards > 0:
		if CurrentCardsCycle.size() == 0:
			CurrentCardsCycle = Cards.duplicate(true)
		NextCard = CurrentCardsCycle[CurrentCardsCycle.size() -1]
		CurrentCardsCycle.remove_at(CurrentCardsCycle.size() -1)
		AmountOfCards-= 1
		print(NextCard.Name)
		emit_signal("OnDraw", NextCard)
		await get_tree().create_timer(.10).timeout
		
func _on_button_pressed():
	DrawCards(5)
