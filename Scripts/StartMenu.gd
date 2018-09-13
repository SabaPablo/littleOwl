extends Control

var level_1 = "res://Scenes/principal_level_1.tscn"
var sheet = preload("res://Scenes/sheet.tscn")
var width
var height


func _on_StartGameButton_pressed():
	get_tree().change_scene(level_1)

func _on_QuitGameButton_pressed():
	get_tree().quit()

func _ready():
	width = get_viewport().get_visible_rect().size.x
	height = get_viewport().get_visible_rect().size.y
	
func _on_Timer_timeout():
	print("time")
	var new_sheet = sheet.instance()
	new_sheet.set_global_position(Vector2(rand_range(-width/2,width/2),-100))
	add_child(new_sheet)


