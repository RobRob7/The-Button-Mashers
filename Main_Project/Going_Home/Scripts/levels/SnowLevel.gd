extends Node2D

# player camera var
var playerCamera

# player var
var player

# on scene start, get node player and set camera bounds
func _ready():
	player = get_node("Player")
	playerCamera = player.get_child(2)
	playerCamera.limit_left = -1632
	playerCamera.limit_right = 1088
	playerCamera.limit_top = -96
	playerCamera.limit_bottom = 208
