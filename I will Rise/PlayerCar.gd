extends VehicleBody


var acclen = 400
var turn_speed = 0.5
var streing_taget 
var braking = 10
onready var water = $"../WATER"

# moving the car the player is in 
# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	streing_taget = Input.get_action_strength("left")-Input.get_action_strength("right")
	
	if Input.is_action_pressed("forward"):
		engine_force = acclen
	else:
		engine_force = 0 
	
	if Input.is_action_pressed("back"):
		engine_force = -acclen
	else:
		brake = 0 
	
	steering = move_toward(steering, streing_taget,turn_speed *delta)	 

#if water.global_transform.translation.y > global_transform.translation.y:
#
#timer for watter damageing over time

func _on_Timer_timeout():
	if water.global_transform.origin.y > global_transform.origin.y:
		PlayerStats.change_health(-5)
