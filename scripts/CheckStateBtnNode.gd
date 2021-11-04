extends "res://scripts/mainScene.gd"

onready var StateText = $"/root/mainScene/StatePanel/StateText"


func _on_CheckState_pressed():
	$"/root/mainScene/StatePanel".visible = true
	match Global.PeopleSize:
		10:
			if Global.PeopleMood < 20:
				StateText.text = "十几厘米的小人望着数十米高的你，有一些畏惧。"
			elif Global.PeopleMood >= 20 && Global.PeopleMood < 50:
				StateText.text = "小人已经不再对你感到畏惧，已经会主动跑去你的小腿边示好了。"
			elif Global.PeopleMood >= 50 && Global.PeopleMood <= 100:
				StateText.text = "小人已经对你已经极其的依赖，已经可以接受你对他们做任何事情了。"
		100:
			if Global.PeopleMood < 20:
				StateText.text = "连你的脚趾的高度都没有的小人抬头望着巨神一样的你，感到有一些恐惧。" 
			elif Global.PeopleMood >= 20 && Global.PeopleMood < 50:
				StateText.text = "小人已经不再对你感到恐惧，但是你的巨足在他们旁边的时候还是会令他们有些发毛。"
			elif Global.PeopleMood >= 50 && Global.PeopleMood <= 100:
				StateText.text = "小人们已经完全不害怕你巨大的体型了，甚至还会主动跑到比他们还要大几倍的脚趾旁轻轻舔舐。"

func _on_exitbutton_pressed():
	$"/root/mainScene/StatePanel".visible = false
