extends Control

# List of level scene file paths
var level_scenes = [
	"res://Scenes/levels/Level 1.tscn"
	# Add more level scenes as needed
]

var progress_file = "user://progress.json"
var highest_completed_level = 0

func _ready():
	# Load the highest completed level from the progress file
	load_progress()

	# Connect button pressed signals to the on_level_button_pressed function
	var level_number = 1
	for button in get_node("GridContainer").get_children():
		button.connect("pressed", self, "_on_level_button_pressed", [button])
		
		# Disable buttons for levels that haven't been unlocked
		if level_number > highest_completed_level + 1:
			button.disabled = true
		level_number += 1

func _on_level_button_pressed(button: Button):
	# Get the level index based on the button's text and load the corresponding level
	var level_index = int(button.text.replace("Level ", "")) - 1
	if level_index >= 0 and level_index < level_scenes.size():
		var level_scene = load(level_scenes[level_index])
		if level_scene:
			get_tree().change_scene_to(level_scene)
		else:
			print("Failed to load level scene:", level_scenes[level_index])
	else:
		print("Invalid level index:", level_index)

func load_progress():
	var file = File.new()
	if file.file_exists(progress_file):
		file.open(progress_file, File.READ)
		var data = JSON.parse(file.get_as_text())
		highest_completed_level = data.result
		file.close()
	else:
		highest_completed_level = 0

func _on_Back_Button_pressed():
	get_tree().change_scene("res://Scenes/MainMenu/MainMenu.tscn")
