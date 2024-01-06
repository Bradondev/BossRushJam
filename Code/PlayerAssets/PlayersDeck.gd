extends Node2D


var Cards 
var CurrentCardsCycle


func _ready():
	Cards = get_children()
	CurrentCardsCycle = get_children()

# Called every frame. 'delta' is the elapsed time since the previous frame.


func ReSetDeck():
	CurrentCardsCycle = Cards
	
	
func DrawCards(AmountOfCards):
	
