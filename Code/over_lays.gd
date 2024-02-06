extends Node2D
@export var NextPhasePath :String 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func WinScreen():
	$AnimationPlayer.play("WIn")
	
	
func  LossScreen():
	$AnimationPlayer.play("Lost")




func _on_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Code/PlayerAssets/main_meau.tscn")
	
func _on_continue_pressed():
	Globels.NumberOfWins += 1
	get_tree().paused = false
	get_tree().change_scene_to_file(NextPhasePath)
	

func _on_animation_player_animation_finished(anim_name):
	get_tree().paused = false
