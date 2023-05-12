extends Button

# var used to hold current level
var x

# Called when the node enters the scene tree for the first time.
func _ready():
	x = Global.current_level

# function for when restart button is pressed in player dead menu
func _on_Restart_Button_pressed():
	match(x):
		1:
			get_tree().change_scene("res://Scenes/levels/Level 1.tscn")
		2:
			get_tree().change_scene("res://Scenes/levels/Level 2.tscn")
		3:
			get_tree().change_scene("res://Scenes/levels/SnowLevel.tscn")
	
