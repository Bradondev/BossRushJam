extends Node2D


func StealCard(Amount):
	while Amount > 0:
		var CardstoSteal = get_tree().get_nodes_in_group("BossCards")
		var rng = RandomNumberGenerator.new()
		if CardstoSteal.size() <=0:
			print_debug("Not more cards to steal")
			return
		var my_random_number = rng.randi_range(0, CardstoSteal.size() -1)
		var CardGettingStolen = CardstoSteal[my_random_number]
		var new_parent = $"../CardHolder"
		CardGettingStolen.get_parent().remove_child(CardGettingStolen)
		new_parent.add_child(CardGettingStolen)
		CardGettingStolen.remove_from_group("BossCards")
		CardGettingStolen.add_to_group("Cards")
		var BossCardManger = get_tree().get_nodes_in_group("BossCardPlaces")[0]
		var StealCardBoss =  get_tree().get_nodes_in_group("StealCardBoss")[0]
		BossCardManger.CutCardFromCardInPlay(CardGettingStolen)
		$"../CardsInPlayPlace"._on_players_deck_on_draw(CardGettingStolen)
		CardGettingStolen.BossCard = false
		CardGettingStolen.CanBeUsed = $"..".PlayerCanUseCards
		CardGettingStolen.UsePoint = $"../UseArea".global_position
		CardGettingStolen.global_position.y = $"../CardsInHandHolder".global_position.y -27
		for effects in CardGettingStolen.Effects:
			var NameOfEffect = effects.get_name()
			if NameOfEffect == "Draw":
				effects.disconnect("DrawCard", BossCardManger.get_parent().DrawCards)
			if NameOfEffect =="Attack":
				effects.disconnect("AttackBoss",BossCardManger.get_parent().CurrentEnemy.TakeDamage)
			if NameOfEffect =="Heal":
				effects.disconnect("Heal",BossCardManger.get_parent().CurrentPLayer.Heal)
			if NameOfEffect =="Steal":
				effects.disconnect("Steal",StealCardBoss.StealCard)
			if NameOfEffect =="Shield":
				effects.disconnect("Shield",BossCardManger.get_parent().CurrentPLayer.ShieldUpdate)
			if NameOfEffect =="OverDrawBuff":
				effects.disconnect("OverDrawBuff",BossCardManger.OverDrawBuffUpdata)
				

				#effects.disconnect("Steal")
		CardGettingStolen.disconnect("OnClick",BossCardManger.CutCardFromCardInPlay)
		Amount -=1
		#effects.ConnectSignal("DrawCard", $"..".DrawCards)
		#effects.ConnectSignal("AttackBoss",$"..".CurrentEnemy.TakeDamage)
		#effects.ConnectSignal("Recoil",$"..".CurrentPLayer.TakeDamage)
		#effects.ConnectSignal("Steal",$"../StealCard".StealCard)
		#effects.ConnectSignal("Heal",$"..".CurrentPLayer.Heal)
		#effects.ConnectSignal("Shield",$"..".CurrentPLayer.ShieldUpdate)
func _on_button_pressed():
	StealCard(3)
	
