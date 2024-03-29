extends Node2D

signal  EndPhase
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func PickedAPack(ChoosenPack):
	var CardPacks= []
	for CardPackHolder in  $AllPacks.get_children():
		CardPacks.append(CardPackHolder.get_child(0))
	for cardPack in CardPacks:
		cardPack.MouseChecker.visible = false
		if cardPack == ChoosenPack: 
			cardPack.Move($Marker2D.global_position)
			cardPack.MakeCardsNotVisable()
		else:
			cardPack.queue_free()
	$Timer.start()
	

func _on_timer_timeout():
	
	$AnimationPlayer.play("LabalCardsBeenAdded")


func _on_animation_player_animation_finished(anim_name):
	pass


func _on_done_button_pressed():
	$SaveManager.SaveItem()
	emit_signal("EndPhase")
	queue_free()

func PlayPhase():
	$AnimationPlayer.play("ShowPacks")
	visible = true
