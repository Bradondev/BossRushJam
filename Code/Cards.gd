class_name  CardAttacks extends Node2D

@export var Name :String
@export var AttackDamage :int
@export var SecondAttackDamage :int
@export var description : String

@export_enum("Fire", "Light", "Air", "Dark","Water","Earth") var Type: String
@export_enum("Fire", "Light", "Air", "Dark","Water","Earth") var SecondType: String


@export var OnUseSignal = ""


signal  OnClick
signal ChangeCombo


var Up = false
var hasMoved = false
var Down = false
var NewPositon
var NextDrawPosition
var Drawing = false 
var OldPositon

var DistanceMoved = 120
@onready var LabelName = $Name
@onready var AttackLabel = $AttackLabel
@onready var Description = $description
@onready var CardEffectHolder= $"Card EffectHolder"
var Effects
# Called when the node enters the scene tree for the first time.
func _ready():
	LabelName.text = Name
	AttackLabel.text = str(AttackDamage)
	Description.text = description
	Effects =CardEffectHolder.get_children()
func _physics_process(delta):
	if Up == true:
		self.global_position.y = lerp(self.global_position.y,  NewPositon,.1 )
		scale.x = lerp(scale.x, float(2),.1)
		scale.y = lerp(scale.y, float(2),.1)
	if  Down == true and hasMoved :
		self.global_position.y = lerp(self.global_position.y, NewPositon +DistanceMoved ,.1 )
		scale.x = lerp(scale.x, float(1),.1)
		scale.y = lerp(scale.y, float(1),.1)
	if Drawing == true:
		self.global_position.x = lerp(self.global_position.x, NextDrawPosition ,.1 )
		
	
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
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			emit_signal("OnClick",self)
			emit_signal("ChangeCombo", Type)
			visible = false
			OnUse()
			queue_free()



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
	for effects in Effects:
		effects.UseEffect()
