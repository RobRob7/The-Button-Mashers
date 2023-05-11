extends Button

const player_on_level = preload("res://Scripts/Player/Player.gd")
var x
# Called when the node enters the scene tree for the first time.
func _ready():
	x = Global.current_level


func _on_Restart_Button_pressed():
	#get_tree().change_scene("res://Scenes/levels/Level 1.tscn")
	match(x):
		1:
			get_tree().change_scene("res://Scenes/levels/Level 1.tscn")
		2:
			get_tree().change_scene("res://Scenes/levels/Level 2.tscn")
		3:
			get_tree().change_scene("res://Scenes/levels/SnowLevel.tscn")
	
