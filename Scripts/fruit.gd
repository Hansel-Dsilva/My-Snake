extends Area2D

# warning-ignore:unused_signal
signal fruit_eaten

var score := 100

func _on_fruit_area_entered(area):
	if area.name == 'head':
		call_deferred("queue_free")
		call_deferred("emit_signal", "fruit_eaten")
		PlayerData.score += score
