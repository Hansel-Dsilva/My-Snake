extends Node2D

var direction := Vector2(1,0)
var next_tail_dir := Vector2(1,0)
var prev_dir := Vector2(1,0)
const gap = 35
var speed = 12
onready var tail = preload("res://Scenes/tail.tscn")

func add_tail():
	var inst = tail.instance()
	var prev_tail = get_child(get_child_count() - 1)
	if prev_tail.name != 'head':
		inst.cur_dir = prev_tail.cur_dir
		for i in range(0, prev_tail.pos_array.size()):
			inst.pos_array.append(prev_tail.pos_array[i])
			inst.directions.append(prev_tail.directions[i])
		inst.position = prev_tail.position - prev_tail.cur_dir * gap
	else:
		inst.cur_dir = direction
		inst.position = prev_tail.position - direction * gap
	add_child(inst)

#func _input(event):
#	if event is InputEventKey and event.pressed and not event.echo:
#		if event.is_action_pressed("ui_right") or event.is_action_pressed("ui_left"):
#			direction.x = int(event.is_action_pressed("ui_right")) - int(event.is_action_pressed("ui_left"))
#			direction.y = 0
#		elif event.is_action_pressed("ui_down") or event.is_action_pressed("ui_up"):
#			direction.y = int(event.is_action_pressed("ui_down")) - int(event.is_action_pressed("ui_up"))
#			direction.x = 0
#		direction = direction.normalized()
#		get_tree().set_input_as_handled()
		
#func movement():
#	if Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left"):
#		direction.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
#		direction.y = 0
#	elif Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_up"):
#		direction.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
#		direction.x = 0
	#direction = direction.normalized()
	#get_tree().set_input_as_handled()

func _physics_process(delta):
	if(Input.is_action_pressed("ui_up")):
		direction = Vector2(0,-1)
	elif(Input.is_action_pressed("ui_down")):
		direction = Vector2(0,1)
	elif(Input.is_action_pressed("ui_left")):
		direction = Vector2(-1,0)
	elif(Input.is_action_pressed("ui_right")):
		direction = Vector2(1,0)
# movement of head
	var dir_change = false
	if prev_dir != direction:
		prev_dir = direction
		dir_change = true
	var head_pos = $head.position
	$head.position += Vector2(int(direction.x), int(direction.y)) * speed# * delta
# note change in direction for tails
	if dir_change:
		for i in range(1, get_child_count()):
			get_child(i).add_to_tail(head_pos, direction)
# Fix alignment
	for i in range(0, get_child_count()-1):
		if not get_child(i+1).directions:
			if get_child(i).position.distance_to(get_child(i+1).position) != gap:
				if i == 0:
					get_child(i+1).position = $head.position - direction * gap
					get_child(i+1).cur_dir = direction
				else:
					get_child(i+1).position = get_child(i).position - get_child(i).cur_dir * gap
					get_child(i+1).cur_dir = get_child(i).cur_dir
				
