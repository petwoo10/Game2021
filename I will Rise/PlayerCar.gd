extends VehicleBody


var acclen = 400
var turn_speed = 1
var streing_taget 
var braking = 10


# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	streing_taget = Input.get_action_strength("left")-Input.get_action_strength("right")
	
	if Input.is_action_pressed("forward"):
		engine_force = acclen
	else:
		engine_force = 0 
	
	if Input.is_action_pressed("back"):
		brake = braking
	else:
		brake = 0 
	
	steering = move_toward(steering, streing_taget,turn_speed *delta)	 
