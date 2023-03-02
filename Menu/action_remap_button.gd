extends Button

@export var action: String = "default_input"

# Called when the node enters the scene tree for the first time.
func _ready():
	assert(InputMap.has_action(action))
	set_process_unhandled_key_input(false)
	display_current_key()
	



func display_current_key():
	var current_key = InputMap.action_get_events(action)[0].as_text()
	text = "%s Key" % current_key
