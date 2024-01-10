class_name CardEffect extends Node2D

@export var Name :String
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func  ConnectSignal(name_of_signal,target_function):
	if not has_signal(name_of_signal):
		print("Error: Signal '", name_of_signal, "' not found in current object.")
		return
	connect(name_of_signal, target_function)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
