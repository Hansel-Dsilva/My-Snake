extends Control

onready var scene_tree := get_tree()
onready var pause_overlay : ColorRect = get_node("PauseOverlay")
onready var score : Label = $Score
var paused := false setget set_paused

func _ready():
	PlayerData.score = 0
# warning-ignore:return_value_discarded
	PlayerData.connect("score_updated", self, "update_interface")
# warning-ignore:return_value_discarded
	#PlayerData.connect("player_died", self, "_on_PlayerData_player_died")
	update_interface()
	
#func _on_PlayerData_player_died():
	

func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("ui_cancel"):
		self.paused = not paused
		scene_tree.set_input_as_handled()

func update_interface():
	score.text = "Score: %s" % PlayerData.score

func set_paused(value: bool):
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value


func _on_MainMenu_button_up():
	self.paused = not paused
