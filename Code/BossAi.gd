extends Node2D

var CardsThatCanBeUsedUse 
var CardThatAreGoingToBeUse
var TempNumberArray =[]
var NumberOfCardsBeingPlayed = [3,5,2,4,5,0]
var AttackIndex = 0
signal  EndTurn
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func FindCardstoUse():
	var temp = 0
	if AttackIndex == NumberOfCardsBeingPlayed.size() :
		AttackIndex = 0
		print_debug("reset")
	TempNumberArray = []
	CardsThatCanBeUsedUse  = get_children()
	for Card in CardsThatCanBeUsedUse:
		if TempNumberArray.size()==0:
			TempNumberArray.append(0)
		else:
			TempNumberArray.append(temp)
		temp += 1
		# Shuffle the array
	print(TempNumberArray)
	TempNumberArray.shuffle()
	# Select the first three elements
	print_debug(AttackIndex)
	var random_indices = TempNumberArray.slice(0,NumberOfCardsBeingPlayed[AttackIndex])
	
	for numbers in random_indices:
		CardsThatCanBeUsedUse[numbers].NewPositon =  CardsThatCanBeUsedUse[numbers].global_position.y + 50
		CardsThatCanBeUsedUse[numbers].BossWillUse = true
	UseCards()
	AttackIndex +=1
		
func UseCards():
	for card in CardsThatCanBeUsedUse:
		print_debug(card)
		if is_instance_valid(card) and card.BossWillUse    == true:
			card.OnUse()
		await get_tree().create_timer(.2).timeout
	emit_signal("EndTurn")


func _on_timer_timeout():
	pass # Replace with function body.
