extends Node2D


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


func _on_retry_pressed():
	pass # Replace with function body.


func _on_menu_pressed():
	pass # Replace with function body.


func _on_continue_pressed():
	pass # Replace with function body.
