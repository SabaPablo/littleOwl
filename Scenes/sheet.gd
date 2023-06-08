extends RigidBody2D

var res = 0
var multi = 1

func _ready():
	res = rand_range(-1,1)
	pass

func _physics_process(delta):
	
	res = res + multi * delta
	if res > 1:
		multi = -1
	if res < -1:
		multi = 1
	get_node("sheet_sprite").rotate(res * delta)
	set_linear_velocity(Vector2(res * rand_range(40,70),rand_range(10,100)))
