extends Node2D



func _on_Play_body_entered(body):
	if body.is_in_group("Player"):
		LevelTransition.change_level()


func _on_About_body_entered(body):
	if body.is_in_group("Player"):
		$about.visible=true
		yield(get_tree().create_timer(3),"timeout")
		$about.visible=false
