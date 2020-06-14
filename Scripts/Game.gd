extends Node2D

onready var fruit = preload("res://Scenes/fruit.tscn")


func _ready():
	add_fruit()
	pass

func add_fruit():
	var inst = fruit.instance()
	inst.position = get_random_vector(900, 50, 500, 50)
	inst.connect("fruit_eaten", self, "spawn_next_fruit_and_tail")
	add_child(inst)

func spawn_next_fruit_and_tail():
	add_fruit()
	$snake.add_tail()
	
func get_random_vector(xMAX, xMIN, yMAX, yMIN):
	randomize()
	var x = randi() % xMAX + xMIN
	randomize()
	var y = randi() % yMAX + yMIN
	return Vector2(x, y)
