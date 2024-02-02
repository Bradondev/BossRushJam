class_name  CardAttacks extends Node2D

@export var Name :String
@export var AttackDamage :int
@export_multiline var description : String

@export_enum("Fire", "Light", "Air", "Dark","Water","Earth") var Type: String

@export var OnUseSignal = ""
@export var PlayerUsing = true

signal  OnClick
signal ChangeCombo
signal BossUses

var BossWillUse = false
var CanBeUsed = true
var Up = false
var BossCard = false
var hasMoved = false
var Down = false
var NewPositon
var NextDrawPosition
var NextDrawPositionY
var Drawing = false 
var OldPositon
var IsUsed = false
var UsePoint
var DistanceMoved = 120
var CardEffects 
var ShowingOff = false
var ShowingOffPoint 
@onready var LabelName = $Name
@onready var AttackLabel = $AttackLabel
@onready var Description = $description
@onready var CardEffectHolder= $"Card EffectHolder"
@onready var Back = $Back
@onready var MouseChecker =$MouseChecker
var Effects
# Called when the node enters the scene tree for the first time.
func _ready():
	if $"Card EffectHolder".get_children():
		CardEffects =$"Card EffectHolder".get_children()
	if PlayerUsing:
		$Back.visible= false
	LabelName.text = Name
	AttackLabel.text = str(AttackDamage)
	Description.text = description
	Effects =CardEffectHolder.get_children()
func _physics_process(delta):
	$Back.visible = BossCard
	if Up == true:
		self.global_position.y = lerp(self.global_position.y,  NewPositon ,.1 )
		scale.x = lerp(scale.x, float(2),.1)
		scale.y = lerp(scale.y, float(2),.1)
	if  Down == true and hasMoved and not IsUsed:
		self.global_position.y = lerp(self.global_position.y, NewPositon +DistanceMoved ,.1 )
		scale.x = lerp(scale.x, float(1),.1)
		scale.y = lerp(scale.y, float(1),.1)
	if Drawing == true:
		self.global_position.x = lerp(self.global_position.x, NextDrawPosition ,.1 )
	if IsUsed:
		self.global_position = lerp(self.global_position, UsePoint,.2 )
		scale.x = lerp(scale.x, float(1),.1)
		scale.y = lerp(scale.y, float(1),.1)
		await get_tree().create_timer(.30).timeout
		queue_free()
	if BossWillUse:
		BossWillUSe()
	if ShowingOff:
		self.global_position = lerp(self.global_position, ShowingOffPoint,.05 )
func _on_mouse_checker_mouse_entered():
	$HoldTimer.start()
	z_index = 1
func _on_mouse_checker_mouse_exited():
	$HoldTimer.stop()
	z_index = 0
	Down = true
	Up =false
	

func _on_mouse_checker_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and CanBeUsed:
			IsUsed = true
			OnUse()
			#visible = false
			#queue_free()



func  ConnectSignal(name_of_signal,target_function):
	if not has_signal(name_of_signal):
		print("Error: Signal '", name_of_signal, "' not found in current object.")
		return
	connect(name_of_signal, target_function)
	#print("Connected signal '", name_of_signal, "' to function '", target_function, "'.")

func _on_hold_timer_timeout():
	NewPositon =  self.global_position.y -DistanceMoved
	Up = true
	hasMoved= true
	Down = false
func Draw(Position):
	Drawing = true
	NextDrawPosition = Position
func OnUse():
	IsUsed = true
	emit_signal("OnClick",self)
	emit_signal("ChangeCombo", Type)
	for effects in Effects:
		effects.UseEffect()
func BossWillUSe():
	self.global_position.y = lerp(self.global_position.y,  NewPositon ,.1 )
	BossCard = false
func ShowOffCard(Position, IsShowingOff):
	if IsShowingOff:
		ShowingOff = true
	ShowingOffPoint = Position
