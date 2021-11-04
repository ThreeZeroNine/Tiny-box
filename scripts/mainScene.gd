extends Node2D

onready var tiny_scene = preload("res://scene/tiny.tscn")
onready var tiny_scene_100 = preload("res://scene/tiny100.tscn")

func _on_mainScene_ready():
	if Global.GameStart == false :
		Global.GameStart = true
		showClearText("你是一个刚毕业不久的女生，暂时还没有找到合适的工作，不过自己生活得你，终于有机会可以饲养自己的小人了。",8)

func checkIsEnd():
	if Global.Money <= -1000 && Global.PeopleSize == 10 && Global.PeopleMood <=10:
		Global.end = "1"
		get_tree().change_scene("res://scene/EndScene.tscn")
	elif Global.Money <= -100 && Global.PeopleMood >=10 && Global.PeopleEarnMoneyEnable == false:
		Global.PeopleEarnMoneyEnable = true
		showClearText("小人们很感激你为了他们而负债，于是小人们自发的去为你赚钱。",5.0)
	elif Global.PeopleSize == 10 && Global.PeopleNum > 0 && Global.end == "106":
		Global.Event[0] = 0
func getMoney(num : int):
	Global.Money += Global.PeopleNum * num

func showText(textArr: String):
	var textSpeed = 0.5
	$"/root/mainScene/background/Information".visible = true
	var time = textSpeed * textArr.length()
	$"/root/mainScene/background/Information".text = textArr
	$"/root/mainScene/background/Information".percent_visible = 0
	$"/root/mainScene/background/Information/InformationTween".interpolate_property($"/root/mainScene/background/Information","percent_visible",0,1,1,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	$"/root/mainScene/background/Information/InformationTween".start()
	
func showClearText(textArr: String,delayNum: float):
	$"/root/mainScene/room".visible = false
	$"/root/mainScene/background".visible = false
	$"/root/mainScene/ButtonNode".visible = false
	$"/root/mainScene/background_clear".visible = true
	var textSpeed = 0.3
	$"/root/mainScene/background_clear/Clear_Information".visible = true
	var time = textSpeed * textArr.length()
	$"/root/mainScene/background_clear/Clear_Information".text = textArr
	$"/root/mainScene/background_clear/Clear_Information".percent_visible = 0
	$"/root/mainScene/background_clear/Clear_Information/InformationTween".interpolate_property($"/root/mainScene/background_clear/Clear_Information","percent_visible",0,1,1,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	$"/root/mainScene/background_clear/Clear_Information/InformationTween".start()
	
	yield(get_tree().create_timer(delayNum),'timeout')
	$"/root/mainScene/background".visible = true
	$"/root/mainScene/background_clear".visible = false
	$"/root/mainScene/room".visible = true
	$"/root/mainScene/ButtonNode".visible = true

