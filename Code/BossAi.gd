extends Node2D

var CardsThatCanBeUsedUse 
var CardThatAreGoingToBeUse
var TempNumberArray =[]
var NumberOfCardsBeingPlayed = 3
signal  EndTurn
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func FindCardstoUse():
	var temp = 0
	CardsThatCanBeUsedUse  = get_children()
	for Card in CardsThatCanBeUsedUse:
		if TempNumberArray.size()==0:
			TempNumberArray.append(0)
		else:
			TempNumberArray.append(temp)
		temp += 1
		# Shuffle the array
	TempNumberArray.shuffle()
	# Select the first three elements
	var random_indices = TempNumberArray.slice(0,NumberOfCardsBeingPlayed)
	for numbers in random_indices:
		CardsThatCanBeUsedUse[numbers].NewPositon =  CardsThatCanBeUsedUse[numbers].global_position.y + 50
		CardsThatCanBeUsedUse[numbers].BossWillUse = true
	UseCards()
	
		
func UseCards():
	for card in CardsThatCanBeUsedUse:
		await get_tree().create_timer(1).timeout
		if card.BossWillUse == true:
			card.OnUse()
			
	emit_signal("EndTurn")
