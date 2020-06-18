extends Button

onready var title : Label = get_parent().get_parent().get_node("Title")

func _on_button_pressed():
	HighScore.highscore = 0
	title.text = title.fix_text + '0'
