extends RigidBody



#how the bouler damage player
func _on_Area_body_entered(body):
	if body.is_in_group("Player"):
		PlayerStats.change_health(-10)
