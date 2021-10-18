extends Control

# the health of the player
func _process(delta):
	$ProgressBar.value = PlayerStats.health
