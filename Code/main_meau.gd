extends Node2D



func _on_start_pressed():
	get_tree().change_scene_to_file("res://Code/GamePhases/before_battle.tscn")


func _on_settings_pressed():
	$Settings.visible= true
	$Help.visible= false

func _on_credits_pressed():
	pass # Replace with function body.





func _on_quit_pressed():
	get_tree().quit()
	


func _on_how_to_pay_pressed():
	$Settings.visible= false
	$Help.visible= true



func _on_back_pressed():
	$Settings.visible= false
	$Help.visible= false
