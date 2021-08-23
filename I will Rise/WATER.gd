extends Spatial


var speed = 1


func _process(delta):
	translate(speed * delta * Vector3.UP)
	


func _on_Area_body_entered(body):
	if body.is_in_group("Player"):
		PlayerStats.change_health(-5)
