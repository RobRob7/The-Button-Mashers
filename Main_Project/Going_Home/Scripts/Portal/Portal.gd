extends Area2D



func _on_Hitbox_body_entered(_body) -> void:
	get_tree().change_scene("res://Scenes/levels/Level 2.tscn")
