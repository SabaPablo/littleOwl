extends Control

var level_2 = "res://Scenes/Level_2.tscn"

func _input(event):
    if event is InputEventKey:
        if event.pressed:
            get_tree().change_scene(level_2)

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
