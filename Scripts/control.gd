extends Control

var selected_index = 0 
var buttons = [] 

func _ready():
	buttons = $VBoxContainer.get_children()
	_update_focus()
	
func _unhandled_input(event):
	if event.is_action_pressed("up"):
		selected_index = (selected_index - 1 + buttons.size()) % buttons.size()
		_update_focus()
	elif event.is_action_pressed("down"):
		selected_index = (selected_index + 1) % buttons.size()
		_update_focus()
	elif event.is_action_pressed("interact"):
		buttons[selected_index].emit_signal("pressed")
	
func _update_focus():
	for i in range(buttons.size()):
		if i == selected_index:
			buttons[i].grab_focus()
			buttons[i].add_theme_color_override("font_color", Color(1, 1, 0))
		else:
			buttons[i].add_theme_color_override("font_color", Color(1, 1, 1)) 
