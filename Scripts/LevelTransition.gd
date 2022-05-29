extends Node2D


func change_level(i=0):
	#this function changes the scene to next level and also updates the current_level
	Globals.current_level+=1
	if Globals.current_level<=Globals.max_level and i==0:
		$CanvasLayer/AnimationPlayer.play("fade")
		yield($CanvasLayer/AnimationPlayer,"animation_finished")
		get_tree().change_scene("res://Scenes/Levels/"+str(Globals.current_level)+".tscn")
		$CanvasLayer/AnimationPlayer.play_backwards("fade")
	else:
		LevelTransition.play()
		yield(get_tree().create_timer(1),"timeout")
		get_tree().change_scene("res://Scenes/Menu.tscn")
		Globals.current_level=0
	
	
func play():
	$CanvasLayer/AnimationPlayer.play("fade")
	yield($CanvasLayer/AnimationPlayer,"animation_finished")
	$CanvasLayer/AnimationPlayer.play_backwards("fade")
