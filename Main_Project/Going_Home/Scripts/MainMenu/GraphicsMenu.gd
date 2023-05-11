extends Control

var resolutions = [
	Vector2(800, 600),
	Vector2(1024, 768),
	Vector2(1280, 720),
	Vector2(1920, 1080),
	Vector2(2560, 1440),
	Vector2(3840, 2160)
]

func _ready():
	var dropdown = get_node("VBoxContainer/ResolutionButton")
	for resolution in resolutions:
		dropdown.add_item(str(resolution.x) + "x" + str(resolution.y))


func _on_ResolutionButton_item_selected(index):
	OS.window_size = resolutions[index]


func _on_Back_Button_pressed():
	get_tree().change_scene("res://Scenes/MainMenu/OptionsMainMenu.tscn")


func _on_FullscreenCheckbox_toggled(button_pressed):
	OS.window_fullscreen = button_pressed



func _on_SpinBox_value_changed(value):
	Engine.target_fps = value
