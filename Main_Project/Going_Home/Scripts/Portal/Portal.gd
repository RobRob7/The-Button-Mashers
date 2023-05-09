extends Area2D

const player_on_level = preload("res://Scripts/Player/Player.gd")

func _on_Hitbox_body_entered(_body) -> void:
	Global.current_level = Global.current_level + 1
	
	match(Global.current_level):
		1:
			get_tree().change_scene("res://Scenes/levels/Level 1.tscn")
		2:
			get_tree().change_scene("res://Scenes/levels/Level 2.tscn")
		3:
			get_tree().change_scene("res://Scenes/levels/SnowLevel.tscn")
		4:
			Global.current_level = 1
			get_tree().change_scene("res://Scenes/levels/Level TBD.tscn")
			

		
