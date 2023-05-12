extends Control



# function for when main menu option is pressed
func _on_Back_to_Main_Menu_pressed():
	get_tree().change_scene("res://Scenes/MainMenu/MainMenu.tscn")


# function for when level 1 menu option is pressed
func _on_Level_1_Select_pressed():
	Global.current_level = 1
	get_tree().change_scene("res://Scenes/levels/Level 1.tscn")

# function for when level 2 menu option is pressed
func _on_Level_2_Select_pressed():
	Global.current_level = 2
	get_tree().change_scene("res://Scenes/levels/Level 2.tscn")

# function for when level 3 menu option is pressed
func _on_Level_3_Select_pressed():
	Global.current_level = 3
	get_tree().change_scene("res://Scenes/levels/SnowLevel.tscn")
