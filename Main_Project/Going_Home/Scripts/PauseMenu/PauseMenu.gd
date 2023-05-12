extends Control

# bool var for paused game
var is_paused = false setget set_is_paused

# function for if paused button "esc" is pressed, pause game
func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		self.is_paused = !is_paused

# function for if game is paused, pause entire tree
func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused

# function for when continue button is pressed on pause menu
func _on_Continue_Button_pressed():
	self.is_paused = false

# function for when quit button is pressed on pause menu
func _on_Quit_Button_pressed():
	get_tree().paused = !is_paused
	get_tree().change_scene("res://Scenes/MainMenu/MainMenu.tscn")
