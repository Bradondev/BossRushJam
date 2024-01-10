extends Node2D

var WeaknessList = ["Dark", "Water","Fire"]
var RepeatWeaken =""
var ComboAmount =0
var CurrentTypeForCombo =""
var MaxCombo = 10
signal ChangeCombo
signal  EndCombo




func CheckWeakness(NewCard):
	CurrentTypeForCombo = NewCard
	print(RepeatWeaken)
	var WeaknessCounter = 0
	for Weakness in WeaknessList:
		if NewCard == RepeatWeaken:
			BreakCombo("repeat")
			return
		if Weakness == NewCard:
			AddToCombo(1)
			print("Add to combo!: " + str(ComboAmount))
			RepeatWeaken = NewCard
			return
		else:
			WeaknessCounter += 1  
	if WeaknessCounter >= WeaknessList.size()  :
			BreakCombo("Does not match with weakness")
	
			
			
func  AddToCombo(Amount):
	ComboAmount += Amount
	if ComboAmount > 10:
		ComboAmount = 10
	emit_signal("ChangeCombo", ComboAmount)
func BreakCombo(why):
	print("combo broken: " + why)
	RepeatWeaken = "null"
	if ComboAmount> 0:
		emit_signal("EndCombo",CurrentTypeForCombo,ComboAmount )
	ComboAmount = 0
	emit_signal("ChangeCombo", ComboAmount)
