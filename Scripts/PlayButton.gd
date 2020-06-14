tool 
extends Button

export(String, FILE) var next_scene_path := ""

func _on_button_up():
# warning-ignore:return_value_discarded
	get_tree().change_scene(next_scene_path)

func _get_configuration_warning():
	return "Line 4: next_scene_path not set" if next_scene_path == "" else ""
