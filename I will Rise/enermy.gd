extends KinematicBody

#variables 
var player 
var move_speed = 400
var follow_player = false
var enermy_health = 50
var player_list = ["res://Player.tscn"]
var enemy_attack = 10

#make enermy die
func _process(delta):
	if enermy_health <=0:
		print("dead")



func _physics_process(delta):
	if follow_player == true:
		var pos = player.global_transform.origin
		var facing = -global_transform.basis.z
		look_at(pos,Vector3.UP)
		move_and_slide(facing * move_speed *delta,Vector3.UP)



		

	
	
	

func _on_Area_body_entered(body):
	if body.name == "Player":
		$RayCast.set_enabled(true)
		print("fond player")
		follow_player = true
		player = body 

func _on_Area_body_exited(body):
	if body.name == "Player":
		$RayCast.set_enabled(false)
		print("lost")
		follow_player = false
		


func _on_hitbox_body_entered(body):
	if body.filename in player_list:
		PlayerStats.change_health(-enemy_attack)
