extends Control


func _process(delta):
	$ProgressBar.value = PlayerStats.health
