class_name CardPack extends Node2D

@export var Cards : Array[CardAttacks]




func _on_mouse_clicker_area_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and CanBeUsed:
			
			#visible = false
			#queue_free()

