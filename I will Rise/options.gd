extends MarginContainer

const MainMenu = "res://MainMenu.tscn"

onready var selector_one = $CenterContainer/VBoxContainer/ContainerBackMenu/HBoxContainer/selector

var current_selection = 0

# this is to do with where the selector is and the options 
func _ready():
	print(selector_one.text)
	set_current_selection(0)

# moveing the seletor 
func _process(delta):
	if Input.is_action_just_pressed("ui_down") and current_selection <2:
		current_selection += 1 
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_up") and current_selection > 0:
		current_selection -= 1 
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_accept"):
		handle_selection(current_selection)
		
#what happens when you select an option
func handle_selection(current_selection):
	if current_selection == 0:
		get_tree().change_scene(MainMenu)
		queue_free()
	

#seltorter 
func set_current_selection(_current_selection):
	
	selector_one.text = ""

	if _current_selection == 0:
		selector_one.text = ">"
