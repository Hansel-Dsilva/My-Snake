extends Control

onready var label : Label = $Label

func _ready():
	label.text = label.text % [PlayerData.score]
	PlayerData.score = 0
