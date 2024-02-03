class_name CardPack extends Node2D
var Cards : Array[Node]
var PositionHolder :Array[Node]
var CanClickOnPack = false
var IsMoving = false
var NewPos
@onready var MouseChecker=$MouseChecker
signal  AddCardsToDeck(CardsToAdd)
signal  EndCardPickingPhase
signal  SelfDeck
func _ready():
	$AnimationPlayer2.play("Idle")
	Cards = $CardHolder.get_children()
	PositionHolder = $PointHolder.get_children()
	var cardHolder = get_tree().get_nodes_in_group("CardHolderPlayer")[0]
	var Root = get_tree().get_nodes_in_group("PickPhase")[0]
	connect("AddCardsToDeck",cardHolder.AddCards)	
	connect("SelfDeck",Root.PickedAPack)	
	#connect("EndCardPickingPhase",cardHolder)	
	
func _physics_process(delta):
	if IsMoving:
		self.global_position = lerp(self.global_position, NewPos,.05 )
		$AnimationPlayer.play("GoldHighLights")
func _on_control_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and CanClickOnPack:
			print_debug("press")
			emit_signal("AddCardsToDeck",Cards)
			emit_signal("EndCardPickingPhase")
			emit_signal("SelfDeck",self)
			$AnimationPlayer2.stop()
func _on_mouse_checker_mouse_entered():
	var Temp = 0
	SetOutLine(true)
	$Timer.start()
	for card in Cards:
		card.ShowOffCard(PositionHolder[Temp].global_position, true)
		card.MouseChecker.set_mouse_filter(2)
		card.visible = true
		Temp+=1
	#$AnimationPlayer2.stop()
func _on_mouse_checker_mouse_exited():
	var Temp = 0
	SetOutLine(false)
	$Timer.stop()
	MoveCards($CardHolder.global_position)
	for card in Cards:
		card.visible = false
func MoveCards(pos):
	for card in Cards:
		card.ShowOffCard(pos,true)
func MakeCardsNotVisable():
	for card in Cards:
		card.visible = false
func Move(Pos):
	NewPos = Pos
	IsMoving = true

func _on_timer_timeout():
	CanClickOnPack = true
	$AnimationPlayer.play("GoldHighLights")
func  SetOutLine(On):
	if On:
		$AnimationPlayer.play("OutlineOn")
	else: 
		$AnimationPlayer.play("OutLineOff")


func _on_animation_player_animation_finished(anim_name):
	$AnimationPlayer2.play("Idle")
