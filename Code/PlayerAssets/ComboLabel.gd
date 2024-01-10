extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_combo_manager_change_combo(ComboAmount):
	print("Change combo")
	if ComboAmount == 0:
		text = ""
	elif  ComboAmount > 0:
		text = "[wave amp=50.0 freq=5.0 connected=1]"+ "Combo! "+str(ComboAmount)+"[/wave]"

