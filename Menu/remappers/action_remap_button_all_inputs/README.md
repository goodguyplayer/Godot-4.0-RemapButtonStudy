# action_remap_button_all_inputs

A slight modification from [action_remap_button_origin](https://github.com/goodguyplayer/Godot-4.0-RemapButtonStudy/tree/main/Menu/remappers/action_remap_button_origin). The goal was to attempt and implement the `_unhandled_input()` instead, try and accept different devices.

To ease options, an Enum was made. Enum `Devices`, exported as well to follow the same idea of `actions` being editable in editor. 

This idea initally worked, since each "input" was being removed and added to the list, following the Enum order. But then it quickly displayed the issues.
First issue was that the inputs was being removed and added to the end. An input test, "move_up", has 3 InputKeys reading actions; Keyboard, Mouse and Joystick. In that order, if one were to remap with the mouse, it would remove the mouse action from the list and add to the end. Thus it would be preferable to keep the order.
The second issue was the display. How to keep a button from showing the proper remap button.

The solution was to store previous actions in a variable, readd every one except for the specific one being added, filtered by device, keeping order of "Keyboard, Mouse, Joystick".
Then issue. How to stop one player from using the "Joystick" remap button and add a "keyboard" key? There's an attempt of solving the issue at [action_remap_button_different_actions](https://github.com/goodguyplayer/Godot-4.0-RemapButtonStudy/tree/main/Menu/remappers/action_remap_button_different_actions)