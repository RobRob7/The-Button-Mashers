extends Node2D

# player var
var player

# om scene start, get player node
func _ready():
	player = get_node("Player")

# physics process
func _physics_process(delta):
	# player has died
	check_if_player_died()
		
# function checks if player is dead or not
func check_if_player_died():
	if player.playerDead == 1:
		print("DEAD")
		get_tree().change_scene("res://Scenes/levels/Level 1 Puzzle.tscn")
