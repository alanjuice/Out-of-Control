extends RigidBody2D
var velocity=Vector2.ZERO
export (PackedScene) var bullet
export var recoil_velocity=50
var death

func _physics_process(delta):
	$Gun.look_at(get_global_mouse_position())#look at mouse pointer
	$Gun/reload.value=$Timer.time_left*100
	if Input.is_action_just_pressed("fire") and $Gun/RayCast2D.is_colliding():
		if $Gun/RayCast2D.get_collider() is Area2D==false:
			shoot()
		else:
			pass
			
#func _input(event):
	#if event.is_action_pressed("light"):
		#if $Light2D.enabled==false:
			#$Light2D.enabled=true
		#else:
			#$Light2D.enabled=false
		
func shoot():
	#fire the guns
	if $Timer.time_left==0:#so that the player cant shoot very fast
		var Bullet=bullet.instance()
		owner.add_child(Bullet)
		Bullet.global_transform=$Gun.global_transform
		velocity=(self.position-get_global_mouse_position()).normalized()*-5#backwards force
		linear_velocity=-velocity*recoil_velocity
		Bullet.velocity=velocity
		$fire.play()#firing sound
		$Gun/GunExplosion.emitting=true
		$Timer.start()
	


func _on_outofscreen_screen_exited():
	yield(get_tree().create_timer(1),"timeout")
	get_tree().reload_current_scene()

func kill():
	$co
