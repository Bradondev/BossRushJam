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
			if ComboAmount <=3:
				CurrentBoss.TakeDamage(1)
				CurrentPlayer.Heal(1)
				CurrentPlayer.ShieldUpdate(1)
				return
			if ComboAmount <= 5:
				CurrentBoss.TakeDamage(2)
				CurrentPlayer.Heal(1)
				CurrentPlayer.ShieldUpdate(2)
				return
			if ComboAmount > 8:
				CurrentBoss.TakeDamage(3)
				CurrentPlayer.Heal(3)
				CurrentPlayer.ShieldUpdate(3)
				return
		'Dark':  
			print(Type +" Combo")
			color = "black"
			if ComboAmount <=3:
				$"../StealCard".StealCard(1)
				return
			if ComboAmount <= 5:
				$"../StealCard".StealCard(2)
				return
			if ComboAmount > 5:
				$"../StealCard".StealCard(4)
				return
			#ssteal cards
		'Light':
			print(Type +" Combo")
			color = "yellow"
			CurrentPlayer.Heal(ComboAmount)
			#heal player 
		'Earth':
			print(Type +" Combo")
			color = "brown"
			CurrentPlayer.ShieldUpdate(ComboAmount)
	emit_signal("ChangeComboLabelType", Type, color)


func _on_players_deck_give_weakness_info(boss,player):
	CurrentPlayer = player
	CurrentBoss = boss
