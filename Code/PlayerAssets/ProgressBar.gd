extends TextureProgressBar


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_player_change_lables(Health, maxHealth,Shield):
	max_value = maxHealth
	value = Health
	if Shield > 0:
		$"../../Shield".visible = true
		$"../../Shield/Label".text = str(Shield)
	else:
		$"../../Shield".visible =false
