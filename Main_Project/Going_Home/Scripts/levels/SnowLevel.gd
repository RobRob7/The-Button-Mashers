extends Node2D

var playerCamera
var player

func _ready():
	player = get_node("Player")
	playerCamera = player.get_child(2)
	playerCamera.limit_left = -1632
	playerCamera.limit_right = 1088
	playerCamera.limit_top = -96
	playerCamera.limit_bottom = 208
