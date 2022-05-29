extends Node2D

var i=1

func _ready():
	yield(get_tree().create_timer(1),"timeout")
	

func _process(delta):
	if $ray.is_colliding():
		#$laser.points=[$ray.global_position,$ray.get_collision_point()]
		$laser.add_point($ray.global_position)
		$laser.add_point($ray.get_collision_point())
		if $ray.get_collider().is_in_group("Player"):
			$ray.get_collider().queue_free()
		i+=1
