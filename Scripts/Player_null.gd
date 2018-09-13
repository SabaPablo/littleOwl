extends KinematicBody2D

var jump_speed = 60000
var speed = 30000
var gravity = 100000
var UP = Vector2(0,-1)
var velocity = Vector2()


var height
var width


func _ready():
	width = get_viewport().get_visible_rect().size.x
	height = get_viewport().get_visible_rect().size.y
	velocity.x = 0
	velocity.y = 0
	

func _physics_process(delta):
	velocity.y += gravity * delta
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
		get_node("Sprite").set_flip_h(true)
		$Sprite.play("jump_left")
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
		get_node("Sprite").set_flip_h(false)
		$Sprite.play("jump_left")
	else:
		velocity.x = 0
		if velocity.y > 0:
			$Sprite.play("down")
			get_node("nodeSoundPlayer").play()
		else:
			$Sprite.play("jump_up")
			
		
	var movement = velocity * delta

	move_and_slide(movement, UP) 


func collision(body):
	if body.is_in_group('paddles') and velocity.y >0:
		velocity.y = -jump_speed
		