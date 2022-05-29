extends Area2D
signal fried

	
func _on_Lava_body_entered(body):
	if body.is_in_group("Player"):
		emit_signal("fried")
		body.queue_free()




func _on_Lava_area_entered(area):
	if area.is_in_group("Bullet"):
		pass
