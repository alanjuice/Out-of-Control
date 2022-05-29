extends Area2D
var velocity=Vector2.ZERO


func _physics_process(delta):
	#movement to the right of the bullet
	translate(velocity)


func _on_Bullet_body_entered(body):
	if not body.is_in_group("Player"):
		$bullet.visible=false
		$CollisionShape2D.set_deferred("disabled",true)
		$explod.emitting=true
		set_physics_process(false)
		yield(get_tree().create_timer(1),"timeout")
		queue_free()
