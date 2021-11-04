extends "res://scripts/mainScene.gd"

onready var FeedPeoplePannel = $"/root/mainScene/FeedPeoplePannel"

func _on_FeedPeople_pressed():
	FeedPeoplePannel.visible = true
	
#
#	match Global.PeopleSize:
#		10:
#			if Global.PeopleMood < 100 && Global.PeopleNum > 0:
#				Global.Money -= 1*Global.PeopleNum
#				Global.PeopleMood += 1
#				showText("你花费了一些钱让小人感觉更开心了")
#			elif Global.PeopleNum == 0:
#				showText("你已经没有小人了。")
#			else:
#				showText("小人们已经够感激你了。")
#		100:
#			if Global.PeopleMood < 100 && Global.PeopleNum > 0:
#				Global.Money -= 1*Global.PeopleNum
#				Global.PeopleMood += 1
#				showText("你花费了一些钱让小人感觉更开心了")
#			elif Global.PeopleNum == 0:
#				showText("你已经没有小人了。")
#			else:
#				showText("小人们已经够感激你了。")


func _on_exitbutton_pressed():
	FeedPeoplePannel.visible = false
