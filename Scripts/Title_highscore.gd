extends Label

export var fix_text = "Beat Your Highscore: "

func _ready():
	text += str(HighScore.highscore)
