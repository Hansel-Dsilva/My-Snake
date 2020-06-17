extends Node

var highscore setget set_highscore
const filepath = "user://save_game.json"

func _ready():
	load_highscore()
	if not highscore: highscore = 0
	
func load_highscore():
	var file = File.new()
	if not file.file_exists(filepath): return
	file.open(filepath, File.READ)
	#highscore = file.get_var()
	highscore = parse_json(file.get_as_text())
	file.close()
	pass
	
func save_highscore():
	var xfile = File.new()
	#file.set_current_dir("user://")
	print(xfile.open(filepath, File.WRITE))
	#file.store_var(highscore)
	xfile.store_string(to_json(highscore))
	xfile.close()
	pass
	
func set_highscore(value):
	highscore = value
	save_highscore()
