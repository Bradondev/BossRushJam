extends Node2D



signal  DrawComboBreak

var color
signal  ChangeComboLabelType
var FireBreakDamage :int
var CurrentPlayer:Player
var CurrentBoss:Boss


func _on_combo_manager_end_combo(Type,ComboAmount):
	FireBreakDamage = ComboAmount 
	match Type:
		'Air':  
			print(Type +" Combo")
			color = "green"
			emit_signal("DrawComboBreak",ComboAmount)
		'Fire':
			print(Type +" Combo")
			color = "red"
			CurrentBoss.TakeDamage(FireBreakDamage)
		'Water':
			print(Type +" Combo")
			color = "blue"
		'Dark':  
			print(Type +" Combo")
			color = "black"
			#ssteal cards
		'Light':
			print(Type +" Combo")
			color = "yellow"
			CurrentPlayer.Heal(ComboAmount)
			#heal player 
		'Earth':
			print(Type +" Combo")
			color = "brown"
			#shield
	emit_signal("ChangeComboLabelType", Type, color)



func _on_players_deck_give_weakness_info(boss,player):
	CurrentPlayer = player
	CurrentBoss = boss
