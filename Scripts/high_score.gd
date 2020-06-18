extends Node

var highscore setget set_highscore
var score_time #: String
const filepath = "user://save_game.json"

func _ready():
	load_highscore()
	if not highscore: highscore = 0
	
func load_highscore():
	var file = File.new()
	if not file.file_exists(filepath): return
	file.open(filepath, File.READ)
	#highscore = file.get_var()
	var data = parse_json(file.get_as_text())
	highscore = data['score']
	score_time = data['time']
	file.close()
	
func save_highscore():
	var xfile = File.new()
	print(xfile.open(filepath, File.WRITE))
	xfile.store_string(to_json({'score': highscore, 'time': score_time}))
	xfile.close()
	
func set_highscore(value):
	highscore = value
	var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'June', 'July', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec']
	score_time = str(OS.get_date()['day']) + ' ' + months[OS.get_date()['month']] + ' ' + str(OS.get_date()['year'])
	save_highscore()
