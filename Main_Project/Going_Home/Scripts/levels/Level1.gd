extends Node2D

var player

var playerDeadScreen

func _ready():
	player = get_node("Player")
	#playerDeadScreen = get_node("")

func _physics_process(delta):
	# player has died
	check_if_player_died()
		
	
func check_if_player_died():
	if player.playerDead == 1:
		print("DEAD")
		get_tree().change_scene("res://Scenes/Player/PlayerGameOverScreen.tscn")
