extends Position3D
# the object that is spawing 
var Boulder = preload("res://boulder.tscn")

onready var timer = $Timer
#the radom timer of when the boulder spawns with added foces to move it 
func _on_Timer_timeout():
	var boulder = Boulder.instance()
	add_child(boulder)
	boulder.global_transform = global_transform
	boulder.apply_central_impulse(Vector3(0,0,-1)*1500)
	timer.set_wait_time(rand_range(4,10))
	print(timer.wait_time)
