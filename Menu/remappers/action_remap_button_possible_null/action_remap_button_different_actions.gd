extends Button

enum Devices {
	KEYBOARD,
	MOUSE_ACTIONS,
	GAMEPAD_JOYSTICK,
#	GAMEPAD_BUTTON,
}

@export var action: String = "default_input"
@export var option_device: Devices = 0
@export var unnasign_key = Key.KEY_BACKSPACE

# Called when the node enters the scene tree for the first time.
func _ready():
	assert(InputMap.has_action(action))
#	set_process_unhandled_key_input(false)
	match option_device:
		0:
			action = action + "_keyboard"
		1:
			action = action + "_mouse"
		2:
			action = action + "_joypad"
	set_process_unhandled_input(false)
	display_current_key()
	
	
	
func _toggled(button_pressed):
	set_process_unhandled_input(button_pressed)
	if button_pressed:
		text = "... Key"
		release_focus()
	else:
		display_current_key()
		
		
func _unhandled_input(event):
	if event is InputEventKey:
		if event.get_key_label() == unnasign_key:
			remove_action()
			return
	
	if event is InputEventKey and option_device == Devices.KEYBOARD:
		remap_action_to(event)
	
	if event is InputEventMouseButton and option_device == Devices.MOUSE_ACTIONS:
		remap_action_to(event)
		
	if event is InputEventJoypadMotion and option_device == Devices.GAMEPAD_JOYSTICK:
		if abs(event.axis_value) > 0.5: 
			remap_action_to(event)
			

func remap_action_to(event):
	InputMap.action_erase_events(action)
	InputMap.action_add_event(action, event)
	display_current_key()
	button_pressed = false


func remove_action():
	InputMap.action_erase_events(action)
	display_current_key()
	button_pressed = false
	

func display_current_key():
	var key_list = InputMap.action_get_events(action)
	var current_key = "N/A"
	if key_list.size() > 0:
		current_key = InputMap.action_get_events(action)[0].as_text()
	text = "%s Key" % current_key
