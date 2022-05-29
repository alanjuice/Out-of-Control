extends Node2D

func _process(delta):
	$reload.value=$Player/Timer.time_left*100
	$reload.rect_position=$Player.global_position
	$reload.rect_position.y-=10
