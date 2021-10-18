extends ProgressBar

var health 
var health_max

#heath of the player and max
func _ready():
	health = 100
	health_max = 100
	
#how it changers the health and shows it. 
func change_health(amount):
	health += amount
	health = clamp(health,0,health_max)
	

	
