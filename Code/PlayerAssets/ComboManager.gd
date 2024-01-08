extends Node2D

var WeaknessList = ["Dark", "Water","Fire"]
var RepeatWeaken =""
var ComboAmount =0
var MaxCombo = 10





func _ready():
	CheckWeakness($"../CardHolder/Cardbase7")



func CheckWeakness(NewCard):
	var WeaknessCounter = 0
	for Weakness in WeaknessList:
		if Weakness == NewCard.Type:
			RepeatWeaken =NewCard.Type
			AddToCombo(1)
			print("Add to combo!")
			return
		else:
			WeaknessCounter += 1  
	if WeaknessCounter >= WeaknessList.size():
			BreakCombo()
			
			
func  AddToCombo(Amount):
	ComboAmount += Amount
	if ComboAmount > 10:
		ComboAmount = 10
func BreakCombo():
	ComboAmount = 0
	print("combo broken")
