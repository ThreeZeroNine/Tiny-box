extends "res://scripts/mainScene.gd"

#随机数
var rng = RandomNumberGenerator.new()
var DelayNum = 0
func _physics_process(delta):
	if Global.ScenePeopleNum < Global.PeopleNum:
		match Global.PeopleSize :
			10:
				var tiny = tiny_scene.instance()
				tiny.speed = rng.randi_range(40, 80)
				tiny.moving_left = rng.randi_range(0, 1)
				tiny.position.y = rng.randi_range(740, 880)
				add_child(tiny)
				Global.ScenePeopleNum += 1
			100:
				var tiny100 = tiny_scene_100.instance()
				tiny100.speed = rng.randi_range(40, 80)
				tiny100.moving_left = rng.randi_range(0, 1)
				tiny100.position.y = rng.randi_range(740, 880)
				add_child(tiny100)
				Global.ScenePeopleNum += 1
		
	get_node("PeopleNum").text = "人口数:" + str(Global.PeopleNum)
	get_node("Money").text = "金钱:" + str(Global.Money)
	get_node("PeopleSize").text = "人口大小(倍数):" + str(Global.PeopleSize)
	get_node("Mood").text = "好感度:" + str(Global.PeopleMood)
	get_node("PeopleHunger").text = "饱食度:" + str(Global.PeopleHunger)
	$"/root/mainScene/FeedPeoplePannel/Panel/FeedPeoplePanel_01/food_01/Food_01_Left".text = "库存:"+str(Global.Food_01_Num)
	$"/root/mainScene/FeedPeoplePannel/Panel/FeedPeoplePanel_01/water_01/Water_01_Left".text = "库存:"+str(Global.Water_01_Num)
	$"/root/mainScene/StatePanel/Panel/StatePanel_01/food_01/Food_01_Left".text = "库存:"+str(Global.Food_01_Num)
	$"/root/mainScene/StatePanel/Panel/StatePanel_01/water_01/Water_01_Left".text = "库存:"+str(Global.Water_01_Num)
	checkIsEnd()
	if DelayNum >= 250 :
		DelayNum = 0
		match Global.PeopleSize:
			10:
				if Global.Water_01_Num > 0 && Global.PeopleHunger < 100:
					Global.Water_01_Num = Global.Water_01_Num - Global.PeopleNum
					Global.PeopleHunger += 1
				else:
					Global.PeopleHunger -= 1
				if Global.Food_01_Num > 0 && Global.PeopleHunger < 100:
					Global.Food_01_Num = Global.Food_01_Num - Global.PeopleNum
					Global.PeopleHunger += 1
				else:
					Global.PeopleHunger -= 1
		if Global.PeopleMood >= 10 && Global.PeopleEarnMoneyEnable == true:
			getMoney(Global.PeopleMood/10)
		if Global.PeopleHunger == 100:
			Global.PeopleMood += 1
	else:
		DelayNum+=1
