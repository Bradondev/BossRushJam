class_name  CardAttacks extends Node2D

@export var Name :String
@export var AttackDamage :int
@export var SecondType: String
@export var SecondAttackDamage :int
@export var description : String

@export_enum("Fire", "Light", "Air", "Dark","Water","Earth") var Type: String


signal  OnClick

signal ChangeCombo


var Up = false
var hasMoved = false
var Down = false
var NewPositon
var NextDrawPosition
var Drawing = false 
var OldPositon


@onready var LabelName = $Name


# Called when the node enters the scene tree for the first time.
func _ready():
	LabelName.text = Name
	print("Name Set: "+ Name )
func _physics_process(delta):
	if Up == true:
		self.global_position.y = lerp(self.global_position.y,  NewPositon,.1 )
	if  Down == true and hasMoved :
		self.global_position.y = lerp(self.global_position.y, NewPositon +50 ,.1 )
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


func _on_hold_timer_timeout():
	NewPositon =  self.global_position.y -50
	Up = true
	hasMoved= true
	Down = false
func Draw(Position):
	Drawing = true
	NextDrawPosition = Position
func OnUse():
	pass
