extends MarginContainer


const test_level = "res://test level.tscn"

onready var selector_one = $CenterContainer/VBoxContainer/ContainerStart/HBoxContainer/selector
onready var selector_two = $CenterContainer/VBoxContainer/ContainerOptions/HBoxContainer/selector
onready var selector_three = $CenterContainer/VBoxContainer/ContainerExit/HBoxContainer/selector


var current_selection = 0

func _ready():
	print(selector_one.text)
	set_current_selection(0)
	
func _process(delta):
	if Input.is_action_just_pressed("ui_down") and current_selection <2:
		current_selection += 1 
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_up") and current_selection > 0:
		current_selection -= 1 
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_accept"):
		handle_selection(current_selection)
		

func handle_selection(current_selection):
	if current_selection == 0:
		get_tree().change_scene(test_level)
		queue_free()


func set_current_selection(_current_selection):
	
	selector_one.text = ""
	selector_two.text = ""
	selector_three.text = ""
	if _current_selection == 0:
		selector_one.text = ">"
	elif  _current_selection == 1:
		selector_two.text = ">"
	elif  _current_selection == 2:
		selector_three.text = ">"
		
	
