extends Camera


onready var player_follow = get_parent().get_node("Player")
onready var player_outline = $RayCast



func _process(delta):
	var camera_pos = Vector3.ZERO
	camera_pos.x = player_follow.translation.x-20
	camera_pos.z = player_follow.translation.z-20
	camera_pos.y = player_follow.translation.y+20
	set_translation(camera_pos)
	if player_outline.get_collider():
		print(player_outline)
