extends Node2D


var size


# Called when the node enters the scene tree for the first time.
func _ready():
	size = get_child(0)
	print(size.texture.get_size())


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
