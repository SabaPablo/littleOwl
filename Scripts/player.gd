extends KinematicBody2D

var jump_speed = 60000
var speed = 30000
var gravity = 100000
var UP = Vector2(0,-1)
var velocity = Vector2()

export(NodePath) var camera_path
export(NodePath) var this_scene

var finish = "res://Scenes/finish.tscn"
var level_2 = "res://Scenes/principal_level_2.tscn"
var height
var width

var camera

func _ready():
	camera = get_node(camera_path)
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
	print("coll")
	if body.is_in_group('paddles') and velocity.y >0:
		velocity.y = -jump_speed
	if body.is_in_group('fail') and velocity.y >0:
		body.break()
		velocity.y = 0
	if body.is_in_group('nest') and velocity.y >0:
		print("nest")
		get_tree().change_scene(level_2)
	if body.is_in_group('real_nest') and velocity.y >0:
		print("real_nest")
		get_tree().change_scene(finish)
		

func exit_screen():
	if get_global_position().y > camera.get_global_position().y + height/2:
		get_tree().change_scene(this_scene)
	if get_global_position().x > camera.get_global_position().x and velocity.x > 0:	
		set_global_position(Vector2(-width/2-32,get_global_position().y))
	if get_global_position().x < camera.get_global_position().x and velocity.x < 0:
		set_global_position(Vector2(width/2+32,get_global_position().y))