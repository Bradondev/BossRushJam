extends Node2D

signal  StarttextBubble
signal  First

func _ready():
	$First.visible = true
	emit_signal("First")


