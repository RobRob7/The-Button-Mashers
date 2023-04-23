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
		get_tree().change_scene("res://Scenes/levels/Level 1 Puzzle.tscn")
