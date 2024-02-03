extends Node

@onready var HoverSound =$Hover
@onready var ClickSound =$Click
@onready var DeniedSound =$Denied
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func Hover():
	HoverSound.play()
func Clicked():
	ClickSound.play()
func Denied():
	DeniedSound.play()
