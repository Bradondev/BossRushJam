extends Node2D


var BossUnit: Boss
var PlayerUnit :Player



# Called when the node enters the scene tree for  the first time.
func _ready():
	for nodes in get_children():
		if nodes.get_name() == "Player":
			PlayerUnit = nodes
		if nodes.get_name()== "Boss":
			BossUnit = nodes
	print()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
