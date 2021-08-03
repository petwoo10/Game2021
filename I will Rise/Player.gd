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

#player facing cursor

export var gravity = Vector3.DOWN * 10
export var speed = 14
export var rot_speed = 1


#var velocity = Vector3.ZERO


	
	#inputs for moving

	
	
	
func get_input(delta):
	var vy = velocity.y
	velocity = Vector3.ZERO
	if Input.is_action_pressed("forward"):
		velocity += -transform.basis.z * speed
	if Input.is_action_pressed("back"):
		velocity += transform.basis.z * speed
	if Input.is_action_pressed("right"):
		rotate_y(-rot_speed * delta)
	if Input.is_action_pressed("left"):
		rotate_y(rot_speed * delta)
	velocity.y = vy
	
	
#func get_input():
#	var input = Vector3(
#		-int(Input.is_action_pressed("ui_right")) + int(Input.is_action_pressed("ui_left")),
#		0,
#		-int(Input.is_action_pressed("ui_down")) + int(Input.is_action_pressed("ui_up"))
#	)
#	input = input.normalized()
	
#	return input
	


		
	
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
	
	


	





