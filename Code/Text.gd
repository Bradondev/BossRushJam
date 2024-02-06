extends Control
@export_multiline var Text : Array[String]
signal DialougeDone
var counter = 0
@onready var MainText = $textBubble/RichTextLabel
@onready var Char_Timer = $TextTimer
var DoneTyping = false
var Started = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func  _physics_process(delta):
	if Input.is_action_just_pressed("Space") and DoneTyping :
		if counter == Text.size() -1:
			print("dialouge is done")
			visible = false
			queue_free()
			emit_signal("DialougeDone")
			return
		counter += 1
		MainText.visible_characters = 0
		DoneTyping = false
		Char_Timer.start()
	if DoneTyping:
		$Label.visible = true
	else:
		$Label.visible = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func runtext():
	if Text[counter].length()  == MainText.visible_characters and !DoneTyping:
		DoneTyping = true
		return
	if Text[counter].length()  >= MainText.visible_characters:
		DoneTyping = false
		$AudioStreamPlayer.play()
		SetText(Text[counter])
		MainText.visible_characters += 1
		Char_Timer.start()
		return

func _on_text_timer_timeout():
	runtext()

func SetText(NewText):
	MainText.text = NewText
func  Start():
	$TextTimer.start()
	visible = true
