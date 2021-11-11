extends ProgressBar

#makes it that you go to anoter secne that shows you have lost the game 
const losegame = "res://losegame.tscn"

var health 
var health_max

#heath of the player and max
func _ready():
	health = 100
	health_max = 100
	
	
	 
	
#how it changers the health and shows it.and what happens when you die 
func change_health(amount):
	health += amount
	health = clamp(health,0,health_max)
	if health == 0:
		get_tree().change_scene(losegame)
		queue_free()
	

	
