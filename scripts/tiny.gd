extends KinematicBody2D

var movement = Vector2()
var speed = 50
var moving_left = true


onready var I_ray = $I_ray
onready var I_ray2 = $I_ray2

const UP = Vector2.UP

func _physics_process(delta):
	if I_ray.is_colliding() || I_ray2.is_colliding():
		moving_left = !moving_left
		scale.x = -scale.x
	move()
	
func move():
	movement.x = -speed if moving_left else speed
	movement = move_and_slide(movement,UP)
