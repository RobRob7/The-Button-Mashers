extends Node2D

var player

func _ready():
	player = get_node("Player")

func _physics_process(delta):
	# player has died
	check_if_player_died()
		
	
func check_if_player_died():
	if player.playerDead == 1:
		print("DEAD")
		get_tree().change_scene("res://Scenes/Player/PlayerGameOverScreen.tscn")

func level_completed():
	var level_number = 1
	if level_number > get_node("/root/LevelSelectMenu").highest_completed_level:
		get_node("/root/LevelSelectMenu").highest_completed_level = level_number
		get_node("/root/LevelSelectMenu").save_progress()
