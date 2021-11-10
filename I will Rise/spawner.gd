extends Position3D

var Boulder = preload("res://boulder.tscn")

onready var timer = $Timer

func _on_Timer_timeout():
	var boulder = Boulder.instance()
	add_child(boulder)
	boulder.global_transform = global_transform
	boulder.apply_central_impulse(Vector3(0,0,-1)*2000)
	timer.set_wait_time(rand_range(4,10))
	print(timer.wait_time)
