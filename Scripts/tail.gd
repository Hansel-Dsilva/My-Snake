extends Area2D

var directions = []
var pos_array = []
var cur_dir = Vector2()
var prev_tail

func _physics_process(delta):
	if directions.size():
		if abs(position.distance_to(pos_array[0])) < get_parent().speed/100:
			#print('my pos: ', position, ' arr pos: ', pos_array[0], ' dir: ', directions[0])
			position = pos_array[0]
			cur_dir = directions[0]
			remove_from_tail()
	position += Vector2(int(cur_dir.x), int(cur_dir.y)) * get_parent().speed * delta
	
func remove_from_tail():
	directions.pop_front()
	pos_array.pop_front()

func add_to_tail(head_pos, dir):
	#pos_array.append(Vector2(int(head_pos.x), int(head_pos.y)))
	pos_array.append(head_pos)
	directions.append(dir)
