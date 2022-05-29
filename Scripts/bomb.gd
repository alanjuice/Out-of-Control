extends Area2D
signal killed
var i=0




func _on_bomb_body_entered(body):
	if body.is_in_group("Player"):
		yield(get_tree().create_timer(2),"timeout")
		explode()
		yield(get_tree().create_timer(0.8),"timeout")
		$still_here/CollisionShape2D.disabled=false


	
func explode():
	$bombb.visible=false
	$explod.emitting=true
	



func _on_still_here_body_entered(body):
	if body.is_in_group("Player"):
		body.queue_free()
		emit_signal("killed")
	self.queue_free()
