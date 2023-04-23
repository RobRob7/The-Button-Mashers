extends Area2D



func _on_Hitbox_body_entered(body):
	get_tree().change_scene("res://Scenes/levels/MainScene.tscn")
