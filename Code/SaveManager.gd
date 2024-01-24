extends Node

@export var ItemToSave:Node2D
var NameOfSave 
# Called when the node enters the scene tree for the first time.
func SaveItem():
	var save = PackedScene.new()
	for c in ItemToSave.get_children():
		c.set_owner(ItemToSave)
	save.pack(ItemToSave);
	NameOfSave = "res://"+ItemToSave.get_name()+".tscn"
	ResourceSaver.save(save, NameOfSave);
	print_debug("Saved game")
func LoadItem():
	var SavedDeck = load("res://"+ItemToSave.get_name() +".tscn")
	var old_node = ItemToSave
	var Parent = ItemToSave.get_parent()
	old_node.get_parent().remove_child(old_node)
	Parent.add_child(SavedDeck.instantiate())
	old_node.queue_free()
	Parent.ReloadInfo()
	pass
func _on_button_pressed():
	SaveItem()


func _on_button_2_pressed():
	LoadItem()


