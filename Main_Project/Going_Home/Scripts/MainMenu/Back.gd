extends Button


# function for back menu option is pressed
func _on_Back_pressed():
	get_tree().change_scene("res://Scenes/MainMenu/MainMenu.tscn")
