extends RichTextLabel
@onready var icon = $"../ComboIcon"
@export var Images :Array[Texture2D]
var CurrentImage
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_combo_manager_change_combo(ComboAmount,CardType):
	print("Change combo")
	if ComboAmount == 0:
		text = ""
		icon.texture = null
	elif  ComboAmount > 0:
		text = "[wave amp=50.0 freq=5.0 connected=1]"+str(ComboAmount)+"[/wave]"
	if CardType =="Dark":
			CurrentImage = Images[0]
	elif CardType =="Air":
			CurrentImage = Images[4]
	elif CardType =="Fire":
			CurrentImage = Images[2]
	elif CardType =="Water":
			CurrentImage = Images[3]
	elif CardType =="Earth":
			CurrentImage = Images[1]
	elif CardType =="Light":
			CurrentImage = Images[5]
	icon.texture = CurrentImage
