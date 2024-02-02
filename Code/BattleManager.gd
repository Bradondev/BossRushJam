extends Node2D


var BossUnit: Boss
var PlayerUnit :Player

signal  StartComboBattle
signal  StartPLayarsTurn
signal  StartBossTurn
# Called when the node enters the scene tree for  the first time.

func  _ready():
	#$SaveManager.LoadItem()
	StartBattle()
	$SaveManager.LoadItem()
func  StartBattle():
	emit_signal("StartComboBattle")

func EndBattle(WhoLost):
	if WhoLost == "Player":
		$OverLays.LossScreen()
	if WhoLost == "Boss":
		$OverLays.WinScreen()
