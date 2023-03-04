# action_remap_button_possible_null

This is a modification from [action_remap_button_one_device](https://github.com/goodguyplayer/Godot-4.0-RemapButtonStudy/tree/main/Menu/remappers/action_remap_button_one_device). The question of "How do we simplify so we don't need to add all devices in InputMap" and "How to remove an input from the map?"


Initially, the idea was to create multiple "InputMap" entries for an object. Thus, "move_up" now has "move_up_keyboard", "move_up_mouse" and "move_up_joypad"; Each has their device input. So if I wish to remove and clear an input from keyboard and only listen to mouse, it is possible. It would probably need a Scene to read every input, but it seems viable.

Keeping the logic of verification from the previous code, each button listen to their own device, set up by the developer. With a bonus, there's a new exported variable that represents the `Key` enum, which is used to "cancel" and "Clear" an input. So a player may click the button, use the cancel button and empty the events.

