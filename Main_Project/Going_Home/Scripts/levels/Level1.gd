extends Node2D

var playerCamera
var player

func _ready():
	player = get_node("Player")
	playerCamera = player.get_child(2)
	playerCamera.limit_left = 16
	playerCamera.limit_right = 1008
	playerCamera.limit_top = 16
	playerCamera.limit_bottom = 592
