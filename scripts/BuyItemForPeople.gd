extends Node2D
#购买水
func _on_BuyWater_01_pressed():
	Global.Water_01_Num += 10
	Global.Money -= 1
	$"/root/mainScene/FeedPeoplePannel/Panel/FeedPeoplePanel_01/water_01/Water_01_Left".text = "库存:"+str(Global.Water_01_Num)
#购买面包
func _on_BuyFood_01_pressed():
	Global.Food_01_Num += 10
	Global.Money -= 1
	$"/root/mainScene/FeedPeoplePannel/Panel/FeedPeoplePanel_01/food_01/Food_01_Left".text = "库存:"+str(Global.Food_01_Num)
