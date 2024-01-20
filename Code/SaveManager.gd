extends Node

@export var ItemToSave:Node2D
# Called when the node enters the scene tree for the first time.
func SaveItem():
	var save = PackedScene.new()
	for c in ItemToSave.get_children():
		c.set_owner(ItemToSave)
		save.pack(ItemToSave);
	ResourceSaver.save(save, "res://"+ItemToSave.get_name()+"Number1" +".tscn");
	print_debug("Saved game")
func LoadItem():
	var SavedDeck = load("res://PlayersDeckNumber1.tscn")
	var old_node = ItemToSave
	
	old_node.get_parent().remove_child(old_node)
	add_child(SavedDeck.instantiate())
	old_node.queue_free()
	pass

func _on_button_pressed():
	SaveItem()


func _on_button_2_pressed():
	LoadItem()
