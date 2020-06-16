extends Button

func _on_button_up():
	PlayerData.score = 0
	get_tree().set_deferred("paused", false)
	get_tree().call_deferred("reload_current_scene")
