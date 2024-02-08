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
var PlayedCardCombo =""

func CheckWeakness(NewCard):
	PlayedCardCombo = NewCard
	CurrentTypeForCombo = NewCard
	print(RepeatWeaken)
	var WeaknessCounter = 0
	for Weakness1 in WeaknessList:
		if NewCard == RepeatWeaken:
			BreakCombo("repeat")
			return
		if Weakness1 == NewCard:
			AddToCombo(1 , Weakness1)
			print("Add to combo!: " + str(ComboAmount))
			RepeatWeaken = NewCard
			return
		else:
			WeaknessCounter += 1  
	if WeaknessCounter >= WeaknessList.size()  :
			BreakCombo("Does not match with weakness")
	emit_signal("ChangeCombo", ComboAmount,CurrentTypeForCombo)
			
			
func  AddToCombo(Amount,Weaknes):
	ComboAmount += Amount
	if ComboAmount > 10:
		ComboAmount = 10
	emit_signal("ChangeCombo", ComboAmount,Weaknes)
func BreakCombo(why):
	ComboMistakeAmount -= 1
	if ComboMistakeAmount == 0:
		emit_signal("EndTurn")
	print("combo broken: " + why)
	RepeatWeaken = "null"
	if ComboAmount> 0:
		emit_signal("EndCombo",CurrentTypeForCombo,ComboAmount )
	ComboAmount = 0
	emit_signal("ChangeCombo", ComboAmount,CurrentTypeForCombo)
	ChangeComboMistakeLabel(ComboMistakeAmount)
	


func _on_players_deck_give_weakness_info(boss,player):
	WeaknessList = boss.WeaknessList
func ResetComboLife():
	ComboMistakeAmount = MaxComboMistakeAmount
	ChangeComboMistakeLabel(ComboAmount)
func ChangeComboMistakeLabel(Amount):
	if ComboMistakeAmount == 2:
		$"../UI/P{layerUi/VBoxContainer/Heartr".value = 2
		$"../UI/P{layerUi/VBoxContainer/Heartr2".value = 2
	if ComboMistakeAmount == 1:
		$"../UI/P{layerUi/VBoxContainer/Heartr2".value = 0
	if ComboMistakeAmount == 0:
		$"../UI/P{layerUi/VBoxContainer/Heartr".value = 0
		$"../UI/P{layerUi/VBoxContainer/Heartr2".value = 0


func _on_break_pressed():
	BreakCombo("Break button")
