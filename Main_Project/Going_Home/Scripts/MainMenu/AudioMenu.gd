extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Function that updates the master volume
func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear2db(value / 100.0))

# Convert linear volume to decibel
func linear2db(linear):
	if linear == 0:
		return -100.0
	return 20.0 * log(linear)


func _on_Back_Button_pressed():
	get_tree().change_scene("res://Scenes/MainMenu/OptionsMainMenu.tscn")
