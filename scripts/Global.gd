extends Node

var end = "1"
export var PeopleNum = 1
var ScenePeopleNum = 0
export var PeopleSize = 10
export var Money = 1000
export var PeopleMood = 0
export var PeopleHunger = 100


var Water_01_Num = 0
var Food_01_Num = 0



#开关:
var PeopleEarnMoneyEnable = false
#赚钱开关
var GameStart = false
#游戏开始开关
var ShrunkTo100 = false
#缩小到100倍开关

var Event = [0,0,0,0,0,0,0]
#事件开关
#事件0 初始：大小10 好感0 人数1 100-105
#事件1      大小10 好感0 人数大于1 110
#事件2      大小10 好感>20 人数大于1 120
#事件3      大小100 好感>20 人数>0 130
#事件4      
#事件5
#事件6
