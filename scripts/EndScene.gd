extends Node2D

export var dialogPath = ""
export(float) var textSpeed = 0.05

var dialog

var phraseNum = 0
var finished = false

func _ready():
	Global.ScenePeopleNum = 0
	if Global.end == "2":
		$background_clear/Timer.wait_time = textSpeed
		dialog = getDialog()
		#assert()断言一个条件，如果失败则记录错误
		assert(dialog)
		nextPhrase()
	else:
		$background_clear/Timer.wait_time = textSpeed
		dialog = getDialog()
		#assert()断言一个条件，如果失败则记录错误
		assert(dialog)
		nextPhrase()
		#定义这个Timer（也不知道是啥
	
func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		if finished:
			nextPhrase()
			get_tree().change_scene("res://scene/mainScene.tscn")
		else:
			$background_clear/StoryLable.visible_characters = len($background_clear/StoryLable.text)

#用 -> 指定函数必须返回的类型 获得json文件
func getDialog() -> Array:
	var f = File.new()
	assert(f.file_exists(dialogPath),"file path dose not exist")
	
	f.open(dialogPath,File.READ)
	var json = f.get_as_text()
	
	#检查是否是一个数组
	var output = parse_json(json)
	if typeof(output) == TYPE_ARRAY:
		return output
	else:
		return []

#下一段
func nextPhrase() -> void:
	#如果还需要显示更多的字符
	#如果phraseNum大于或者等于对话的长度
	#则显示下一段
	if phraseNum >= len(dialog):
		queue_free()
		return
	finished = false
	$background_clear/StoryLable.bbcode_text = dialog[phraseNum][Global.end]
	#让字以固定速度播放
	$background_clear/StoryLable.visible_characters = 0
	while $background_clear/StoryLable.visible_characters < len($background_clear/StoryLable.text):
		$background_clear/StoryLable.visible_characters += 1
		$background_clear/Timer.start()
		yield($background_clear/Timer,"timeout")
	finished = true
	phraseNum +=1
	return
	


func _on_skip_pressed():
	if finished:
		nextPhrase()
		get_tree().change_scene("res://scene/mainScene.tscn")
	else:
		$background_clear/StoryLable.visible_characters = len($background_clear/StoryLable.text)
	pass # Replace with function body.
