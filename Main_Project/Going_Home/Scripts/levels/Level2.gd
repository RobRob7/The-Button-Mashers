extends Node2D

var playerCamera
var player

func _ready():
	player = get_node("Player")
	playerCamera = player.get_child(2)
	playerCamera.limit_left = 0
	playerCamera.limit_right = 3840
	playerCamera.limit_top = 0
	playerCamera.limit_bottom = 1495
