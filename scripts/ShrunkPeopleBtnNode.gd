extends "res://scripts/mainScene.gd"



func _on_ShrunkPeopleBtn_pressed():
	match Global.PeopleSize:
		10:
			Global.PeopleSize = 100
			Global.ScenePeopleNum = 0
			get_tree().change_scene("res://scene/EndScene.tscn")
			get_tree().change_scene("res://scene/mainScene.tscn")
		100:
			showText("暂未开放")
