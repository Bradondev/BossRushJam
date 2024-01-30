extends Node2D

var CurrentHandOfCards
var NextCardToPlay
var CardsThatCanBeUsed 
var CardThatAreGoingToBeUse = []
var TempNumberArray =[]
var NumberOfCardsBeingPlayed = 3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func FigureOutAction():
	get_children()


func playCard(card):
	card.OnUse()
func FindCardsToUse():
	var temp = 0
	CardsThatCanBeUsed  =$"../CardsInHandHolder".get_children()
	for Card in CardsThatCanBeUsed:
		var ListOfEffects = []
		for effects in Card.CardEffects:
			ListOfEffects.append(effects.get_name())
		if ListOfEffects.has("Attack"):
			CardThatAreGoingToBeUse.append(Card)
		# Shuffle the array
	# Select the first three elements
	
	
