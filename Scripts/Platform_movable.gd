extends KinematicBody2D

export(NodePath) var camera_path

const FRICTION = -20
var speed = Vector2()
var acc = Vector2()
var direction = 1
var camera

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	pass

func setCamera(camerain):
	camera = camerain

func _physics_process(delta):
	acc.y = 0
	acc.x = 5000
	speed.x = (acc.x * direction * delta)
	speed.y = (acc.y * delta)
	move_and_slide(speed)

func _on_Timer_timeout():

		direction = direction * -1
