extends Area2D


func _on_LevelChanger_body_entered(body):
	if body.is_in_group("Player"):
		LevelTransition.change_level()
		
		
func _input(event):
	if event.is_action_pressed("retry"):
		retry()
		
		

func _on_Lava_fried():
	retry()
	
	
func retry():
	LevelTransition.play()
	yield(get_tree().create_timer(1),"timeout")
	get_tree().reload_current_scene()


