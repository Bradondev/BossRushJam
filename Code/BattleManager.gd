extends Node2D


var BossUnit: Boss
var PlayerUnit :Player

signal  StartComboBattle
signal  StartPLayarsTurn
signal  StartBossTurn
# Called when the node enters the scene tree for  the first time.
func _ready():
	emit_signal("StartComboBattle")
	for nodes in get_children():
		if nodes.get_name() == "Player":
			PlayerUnit = nodes
		if nodes.get_name()== "Boss":
			BossUnit = nodes
	print(BossUnit)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
