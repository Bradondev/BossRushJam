extends Node2D


func StealCard(Amount):
	while Amount > 0:
		var CardstoSteal = get_tree().get_nodes_in_group("PlayerCards")
		var rng = RandomNumberGenerator.new()
		if CardstoSteal.size() <=0:
			print_debug("Not more cards to steal")
			return
		var my_random_number = rng.randi_range(0, CardstoSteal.size() -1)
		var CardGettingStolen = CardstoSteal[my_random_number]
		var new_parent = $"../CardsInHandHolder"
		CardGettingStolen.get_parent().remove_child(CardGettingStolen)
		new_parent.add_child(CardGettingStolen)
		CardGettingStolen.add_to_group("BossCards")
		CardGettingStolen.remove_from_group("PlayerCards")
		var PlayerCardManger = get_tree().get_nodes_in_group("PlayerCardPlaces")[0]
		var StealCardPlayer =  get_tree().get_nodes_in_group("PlayerStealCard")[0]
		PlayerCardManger.CutCardFromCardInPlay(CardGettingStolen)
		$"../CardsInPlayPlace"._on_players_deck_on_draw(CardGettingStolen)
		print_debug(CardGettingStolen.get_name())
		CardGettingStolen.BossCard = true
		CardGettingStolen.CanBeUsed = false
		CardGettingStolen.UsePoint = $"../UseArea".global_position
		CardGettingStolen.global_position.y = $"../CardsInHandHolder".global_position.y -72
		for effects in CardGettingStolen.Effects:
			var NameOfEffect = effects.get_name()
			if NameOfEffect == "Draw":
				effects.disconnect("DrawCard", PlayerCardManger.get_parent().DrawCards)
			elif NameOfEffect =="Attack":
				effects.disconnect("AttackBoss",PlayerCardManger.get_parent().CurrentEnemy.TakeDamage)
			elif NameOfEffect =="Heal":
				effects.disconnect("Heal",PlayerCardManger.get_parent().CurrentPLayer.Heal)
			elif NameOfEffect =="Steal":
				effects.disconnect("Steal",StealCardPlayer.StealCard)
			elif NameOfEffect =="Shield":
				effects.disconnect("Shield",PlayerCardManger.get_parent().CurrentPLayer.ShieldUpdate)
			elif NameOfEffect =="OverDrawBuff":
				effects.disconnect("OverDrawBuff",PlayerCardManger.OverDrawBuffUpdata)
				
				#effects.disconnect("Steal")
		CardGettingStolen.disconnect("OnClick",PlayerCardManger.CutCardFromCardInPlay)
		Amount -=1
		#effects.ConnectSignal("DrawCard", $"..".DrawCards)
		#effects.ConnectSignal("AttackBoss",$"..".CurrentEnemy.TakeDamage)
		#effects.ConnectSignal("Recoil",$"..".CurrentPLayer.TakeDamage)
		#effects.ConnectSignal("Steal",$"../StealCard".StealCard)
		#effects.ConnectSignal("Heal",$"..".CurrentPLayer.Heal)
		#effects.ConnectSignal("Shield",$"..".CurrentPLayer.ShieldUpdate)
func _on_button_pressed():
	StealCard(3)
	
