extends Node2D

signal  StarttextBubble
signal  First
signal  Second
signal 	Last
# Called when the node enters the scene tree for the first time.
func _ready():
	StartText(Globels.NumberOfWins)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func StartText(Number): 
	if Number == 1:
		emit_signal("First")
	if Number == 2:
		emit_signal("Second")
	if Number == 3:
		emit_signal("Last")
