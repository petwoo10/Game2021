extends Spatial


var speed = 2.8



# this is how water risers
func _process(delta):
	translate(speed * delta * Vector3.UP)
	

#how water damage 
func _on_Area_body_entered(body):
	if body.is_in_group("Player"):
		PlayerStats.change_health(-5)
