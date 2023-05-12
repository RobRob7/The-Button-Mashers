extends Control


# function changes scene to main menu (player beat the game)
func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/MainMenu/MainMenu.tscn")
