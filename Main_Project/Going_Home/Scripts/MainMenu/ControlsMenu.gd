extends Control

var currently_editing = null

# Called when the node enters the scene tree for the first time.
func _ready():
	for hbox in get_node("VBoxContainer").get_children():
		if hbox.get_child_count() > 0 and hbox.get_child(1) is Button:
			hbox.get_child(1).connect("pressed", self, "_on_button_pressed", [hbox.get_child(1)])

func _on_button_pressed(button):
	currently_editing = button
	button.text = "Press Key"
	set_process_input(true)

func _input(event):
	if currently_editing and event is InputEventKey and event.pressed:
		var action_name = currently_editing.get_parent().get_node("Label").text
		if update_input_mapping(action_name, event.scancode):
			currently_editing.text = OS.get_scancode_string(event.scancode)
			currently_editing = null
			set_process_input(false)
			save_input_mappings()
		else:
			print("Failed to update input mapping for action:", action_name)

func update_input_mapping(action_name, new_scancode) -> bool:
	if not ProjectSettings.has_action(action_name):
		print("Action not found in Project Settings:", action_name)
		return false

	var current_mappings = ProjectSettings.get_action_list(action_name)
	for mapping in current_mappings:
		if mapping is InputEventKey:
			ProjectSettings.action_erase_event(action_name, mapping)
			break

	var new_event = InputEventKey.new()
	new_event.scancode = new_scancode
	ProjectSettings.action_add_event(action_name, new_event)
	return true

func save_input_mappings():
	ProjectSettings.save()


func _on_Back_Button_pressed():
	get_tree().change_scene("res://Scenes/MainMenu/OptionsMainMenu.tscn")
