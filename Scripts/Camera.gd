extends Camera2D
var player
export(NodePath) var player_path
var velocity = Vector2()
onready var progress = $Score/ProgressBar

func _ready():
	player = get_node(player_path)
	# Called when the node is added to the scene for the first time.
	# Initialization here
	progress.max_value = 3000
	
	pass

func _process(delta):
	get_node("Score/Label").set_text(String(get_score()))
	var a = -3000
	var b = get_score()* 100
	progress.value = get_global_position().y * -1
	get_node("Score/ProgressBar").set_percent_visible(100) 
	if player.get_global_position().y < get_global_position().y:
		set_global_position(Vector2(0,player.get_global_position().y))
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func get_score():
	return int(get_global_position().y * -1)