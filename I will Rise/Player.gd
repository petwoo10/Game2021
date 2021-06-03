extends KinematicBody


onready var camera = get_parent().get_node("Camera")
onready var groundcheck = $groundcheck

export var max_speed = 10
export var friction = 10 
export var speed = 1

var direction = Vector3()
var move_vector = Vector3.ZERO
var cursor_pos = Vector3.ZERO
var gravity = 9.8
var gravity_vec = Vector3()
var velocity = Vector3.ZERO
#player facing cursor

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
	
func get_input():
	var input = Vector3(
		-int(Input.is_action_pressed("ui_right")) + int(Input.is_action_pressed("ui_left")),
		0,
		-int(Input.is_action_pressed("ui_down")) + int(Input.is_action_pressed("ui_up"))
	)
	input = input.normalized()
	return input
	
func _process(delta):
	pass
#gravtiy
func _physics_process(delta):
	direction = Vector3()
	
	#velocity = move_and_slide(velocity, Vector3.UP)

	
	var input = get_input()
	if input != Vector3.ZERO:
		speed += .1
		if speed > max_speed:
			speed = max_speed
	if not is_on_floor():
		input.y = -gravity 
		print("flying")	
	else:
		input.y = 0
		
	print(input, move_vector)
	
	move_vector = input * speed
	move_vector = move_and_slide(move_vector, Vector3.UP, true)
	#move_vector = move_and_slide_with_snap(move_vector, Vector3.DOWN, Vector3.UP, true)
	#print(move_vector)
	
	
	look_at_cursor()

	





