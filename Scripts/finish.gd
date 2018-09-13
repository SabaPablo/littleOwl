extends Control

var StartMenu = "res://Scenes/StartMenu.tscn"

func _input(event):
    if event is InputEventKey:
        if event.pressed:
            get_tree().change_scene(StartMenu)

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
