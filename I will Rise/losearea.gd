extends Area


#makes it that I don't have to type something compercated 
const losegame = "res://losegame.tscn"




#when player enters the area it will change secane 
func _on_Area3_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene(losegame)
