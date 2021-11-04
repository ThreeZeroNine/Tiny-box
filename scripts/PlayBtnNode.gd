extends "res://scripts/mainScene.gd"

func _on_Play_pressed():
	match Global.PeopleSize:
		10:
			if Global.PeopleNum == 0:
				Global.end = "106"
				get_tree().change_scene("res://scene/EndScene.tscn")
			if Global.PeopleNum == 1 && Global.PeopleMood <= 20:
				if Global.Event[0] == 4:
					Global.PeopleNum = 0
					Global.PeopleMood = 0
					Global.Event[0] += 1
					Global.end = "10" + str(Global.Event[0])
				elif Global.Event[0] < 4:
					Global.Event[0] += 1 
					Global.end = "10" + str(Global.Event[0])
				get_tree().change_scene("res://scene/EndScene.tscn")
			elif Global.PeopleNum > 1 && Global.PeopleMood <= 20:
				if Global.Event[1] < 5:
					Global.Event[1] +=1 
					Global.end = "11" + str(Global.Event[1])
				get_tree().change_scene("res://scene/EndScene.tscn")
			elif Global.PeopleNum > 10 && Global.PeopleMood >= 20:
				if Global.Event[2] < 4:
					Global.Event[2] +=1 
					Global.end = "12" + str(Global.Event[2])
				if Global.Event[2] == 4:
					Global.PeopleSize = 100
				get_tree().change_scene("res://scene/EndScene.tscn")
		100:
			if Global.PeopleNum > 0 && Global.PeopleMood >= 20:
				if Global.Event[3] < 4:
					Global.Event[3] += 1
					Global.end = "13" + str(Global.Event[3])
				get_tree().change_scene("res://scene/EndScene.tscn")

