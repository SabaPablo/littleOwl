extends Sprite

export(int) var res = 0
export(int) var multi = 1

# class member variables go here, for example:

# var b = "textvar"

func _ready():
	pass

func _process(delta):
	res = res + multi * delta
	if res > 0.5:
		multi = -1
	if res < -0.5:
		multi = 1
	rotate(res * delta)
