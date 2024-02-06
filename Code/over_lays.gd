extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func WinScreen():
	$AnimationPlayer.play("WIn")
	Globels.NumberOfWins += 1
	
func  LossScreen():
	$AnimationPlayer.play("Lost")




func _on_menu_pressed():
	get_tree().change_scene_to_file("res://Code/PlayerAssets/main_meau.tscn")


func _on_continue_pressed():
	get_tree().change_scene_to_file("res://Code/GamePhases/before_battle.tscn")
