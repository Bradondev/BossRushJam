extends Node2D

var WeaknessList 
var RepeatWeaken =""
var ComboAmount =0
var CurrentTypeForCombo =""
var MaxCombo = 10
signal ChangeCombo
signal  EndCombo
signal  EndTurn
@export var MaxComboMistakeAmount = 2
@export var ComboMistakeAmount = 2
@onready var ComboLabelMistake =$"../ComboLabelMistake"


func CheckWeakness(NewCard):
	CurrentTypeForCombo = NewCard
	print(RepeatWeaken)
	var WeaknessCounter = 0
	for Weakness1 in WeaknessList:
		if NewCard == RepeatWeaken:
			BreakCombo("repeat")
			return
		if Weakness1 == NewCard:
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
	ComboMistakeAmount -= 1
	if ComboMistakeAmount == 0:
		emit_signal("EndTurn")
	print("combo broken: " + why)
	RepeatWeaken = "null"
	if ComboAmount> 0:
		emit_signal("EndCombo",CurrentTypeForCombo,ComboAmount )
	ComboAmount = 0
	emit_signal("ChangeCombo", ComboAmount)
	ChangeComboMistakeLabel(ComboMistakeAmount)
	


func _on_players_deck_give_weakness_info(boss,player):
	WeaknessList = boss.WeaknessList
func ResetComboLife():
	ComboMistakeAmount = MaxComboMistakeAmount
	ChangeComboMistakeLabel(ComboAmount)
func ChangeComboMistakeLabel(Amount):
	ComboLabelMistake.text = str(Amount)
