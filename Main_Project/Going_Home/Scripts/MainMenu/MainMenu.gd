extends Control





func _on_Resume_Game_pressed():
	match(Global.current_level):
		1:
			get_tree().change_scene("res://Scenes/levels/Level 1.tscn")
		2:
			get_tree().change_scene("res://Scenes/levels/Level 2.tscn")
		3:
			get_tree().change_scene("res://Scenes/levels/SnowLevel.tscn")


func _on_Level_Select_pressed():
	get_tree().change_scene("res://Scenes/LevelSelectMenu/LevelSelectMenu.tscn")


func _on_Options_Button_pressed():
	get_tree().change_scene("res://Scenes/MainMenu/OptionsMainMenu.tscn")


func _on_Quit_Button_pressed():
	get_tree().quit()
