extends Node2D

var color
signal  ChangeComboLabelType

func _on_combo_manager_end_combo(Type,ComboAmount):
	match Type:
		'Air':  
			print(Type +" Combo")
			color = "green"
		'Fire':
			print(Type +" Combo")
			color = "red"
		'Water':
			print(Type +" Combo")
			color = "blue"
		'Dark':  
			print(Type +" Combo")
			color = "black"
		'Light':
			print(Type +" Combo")
			color = "yellow"
		'Earth':
			print(Type +" Combo")
			color = "brown"
	emit_signal("ChangeComboLabelType", Type, color)

