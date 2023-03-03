extends Button

enum Devices {
	KEYBOARD,
	MOUSE_ACTIONS,
	GAMEPAD_JOYSTICK,
#	GAMEPAD_BUTTON,
}

@export var action: String = "default_input"
@export var option_device: Devices = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	assert(InputMap.has_action(action))
#	set_process_unhandled_key_input(false)
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
	if event is InputEventKey and option_device == Devices.KEYBOARD:
		remap_action_to(event, Devices.KEYBOARD)
	
	if event is InputEventMouseButton and option_device == Devices.MOUSE_ACTIONS:
		remap_action_to(event, Devices.MOUSE_ACTIONS)
		
	if event is InputEventJoypadMotion and option_device == Devices.GAMEPAD_JOYSTICK:
		if abs(event.axis_value) > 0.5: 
			remap_action_to(event, Devices.GAMEPAD_JOYSTICK)
			

func remap_action_to(event, device):
	var original_actions = InputMap.action_get_events(action)
	InputMap.action_erase_events(action)
	for i in range(original_actions.size()):
		if i == device:
			InputMap.action_add_event(action, event)
		else:
			InputMap.action_add_event(action, original_actions[i])
	display_current_key()
	button_pressed = false


func display_current_key():
	var current_key = InputMap.action_get_events(action)[option_device].as_text()
	text = "%s Key" % current_key
