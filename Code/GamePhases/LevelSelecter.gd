extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func PlayLevel1():
	get_tree().change_scene_to_file("res://FirstBattle.tscn")
func playlevel2():
	get_tree().change_scene_to_file("res://SecondBattle.tscn")
func  PlayLevel3():
	get_tree().change_scene_to_file("res://ThridBattle.tscn")
