extends Control

onready var label : Label = $Label

func _ready():
	if PlayerData.score > HighScore.highscore:
		HighScore.highscore = PlayerData.score
	label.text = label.text % [PlayerData.score, HighScore.highscore]
	PlayerData.score = 0
