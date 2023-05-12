extends Button

# function for when quit to main menu button is pressed in player dead menu
func _on_QuitToMenu_Button_pressed():
	get_tree().change_scene("res://Scenes/MainMenu/MainMenu.tscn")
