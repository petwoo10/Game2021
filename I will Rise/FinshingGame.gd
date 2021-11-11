extends Spatial


const winner = "res://winner game exit.tscn"

#if the player enter area it change secne to win
func _on_Area_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene(winner)
	
