extends KinematicBody


onready var camera = get_parent().get_node("Camera")
onready var groundcheck = $groundcheck

export var max_speed = 10
export var friction = 10 
#export var speed = 1

var attacking = false
var direction = Vector3()
var move_vector = Vector3.ZERO
var cursor_pos = Vector3.ZERO
#var gravity = 9.8
var gravity_vec = Vector3()
var velocity = Vector3.ZERO
var melee_damage= 50
#player facing cursor
onready var attck = $newplayer/AnimationPlayer

export var gravity = Vector3.DOWN * 10
export var speed = 8
export var rot_speed = 0.85

#var velocity = Vector3.ZERO

func look_at_cursor():
	var player_pos = global_transform.origin
	var drop_plane = Plane(Vector3(0,1,0), player_pos.y)
	var ray_length = 1000
	var mouse_pos = get_viewport().get_mouse_position()
	var from = camera.project_ray_origin(mouse_pos)
	var to = from + camera.project_ray_normal(mouse_pos) *ray_length
	cursor_pos = drop_plane.intersects_ray(from,to)
	look_at(cursor_pos,Vector3.UP)
	
	#inputs for moving

	
	
	
func get_input(delta):
	var vy = velocity.y
	velocity = Vector3.ZERO
	if Input.is_action_pressed("forward"):
		velocity += -transform.basis.z * speed
	if Input.is_action_pressed("back"):
		velocity += transform.basis.z * speed
	if Input.is_action_pressed("right"):
		velocity+=transform.basis.x * speed#rotate_y(-rot_speed * delta)
	if Input.is_action_pressed("left"):
		velocity-=transform.basis.x * speed#rotate_y(rot_speed * delta)
	velocity.y = vy
	
	
#func get_input():
#	var input = Vector3(
#		-int(Input.is_action_pressed("ui_right")) + int(Input.is_action_pressed("ui_left")),
#		0,
#		-int(Input.is_action_pressed("ui_down")) + int(Input.is_action_pressed("ui_up"))
#	)
#	input = input.normalized()
	
#	return input
	
func melee():
	if Input.is_action_just_pressed("ui_accept"):
		$newplayer/AnimationPlayer.play("attck")
		var checkenemy = $hitbox.get_overlapping_bodies()
		attacking = true
		print("attacking")
		for enermy in checkenemy:
			if enermy.is_in_group("enemy"):
				enermy.enermy_health -= 10
				if enermy.enermy_health <= 0:
					print("dead")
					enermy.queue_free()
		yield($newplayer/AnimationPlayer,"animation_finished")
		attacking = false

		
	
func _process(delta):
	#if attack pushed
		#checkenemy = area.get_overlappingbodies
		#for enemy in checkenemy 
			#if enemy.isingroup(enemy)
				#kill enemy
	
	pass
#gravtiy
func _physics_process(delta):
	direction = Vector3()
	
	#velocity = move_and_slide(velocity, Vector3.UP)

	
#	var input = get_input()
#	if input != Vector3.ZERO:
#		speed += .1
#		if speed > max_speed:
#			speed = max_speed
#	if not is_on_floor():
#		input.y = -gravity 
##		print("flying")	
#	else:
#		input.y = 0
		
	#print(input, move_vector)
	velocity += gravity * delta
	get_input(delta)
	velocity = move_and_slide(velocity, Vector3.UP,true)
	#move_vector = input * speed
	#move_vector = move_and_slide(move_vector, Vector3.UP, true)
	if not attacking:
		if move_vector !=Vector3.ZERO:
			$newplayer/AnimationPlayer.play("running")
			
		else:
			$newplayer/AnimationPlayer.play("idle")
		#move_vector = move_and_slide_with_snap(move_vector, Vector3.DOWN, Vector3.UP, true)
		#print(move_vector)
		
	melee()
	look_at_cursor()

	





