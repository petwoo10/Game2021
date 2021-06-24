extends ProgressBar

var health 
var health_max


func _ready():
	health = 100
	health_max = 100
	
func change_health(amount):
	health += amount
	health = clamp(health,0,health_max)
	

	
