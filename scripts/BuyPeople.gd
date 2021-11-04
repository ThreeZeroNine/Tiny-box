extends "res://scripts/mainScene.gd"

func _on_BuyPeopleBtn_pressed():
	if Global.PeopleNum >= 15 && Global.PeopleSize == 10:
		showText("你家里已经无法容纳更多小人了。")
	elif Global.PeopleNum >= 100 && Global.PeopleSize == 100:
		showText("你家里已经无法容纳更多小人了。")
	else:
		Global.Money-=100
		Global.PeopleNum+=1
