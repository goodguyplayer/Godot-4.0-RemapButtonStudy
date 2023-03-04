# action_remap_button_one_device

Based on [action_remap_button_all_inputs](https://github.com/goodguyplayer/Godot-4.0-RemapButtonStudy/tree/main/Menu/remappers/action_remap_button_all_inputs) and attempting to solve its issue of "Separating each Device to their own button". 

The easiest solution was to reuse the exported Enum, `Devices`, set by the developer and compare/validate with the checks. Thus the if checks are expanded to include a second condition, if the button enum matches with the check. So buttons set with `Devices.KEYBOARD` only listens to `InputEventKey`, ignoring `InputEventMouseButton` and `InputEventJoypadMotion`.

Therefore, we have 4 actions with 3 inputs each. `move_direction` assigned to keyboard (0), mouse action (1) and joystick (2). But if we keep that order, then we would need a gamepad option for pressing buttons. Or mouse motion. What if we want the button to be Not Assigned?

An attempt to answer that was made with [action_remap_button_different_actions](https://github.com/goodguyplayer/Godot-4.0-RemapButtonStudy/tree/main/Menu/remappers/aaction_remap_button_different_actions).