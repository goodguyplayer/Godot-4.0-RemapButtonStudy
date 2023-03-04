# action_remap_button_origin

The original remap method of which I used as base.
It originated from [GUI Input Mapping](https://github.com/godotengine/godot-demo-projects/tree/3.5-9e68af3/gui/input_mapping), Godot v3.5;

As an attempt to understand it while learning Godot v4.0, I edited and tried to learn the methods used.
From the documentations, [`_unhandled_key_input()`](https://docs.godotengine.org/en/stable/classes/class_node.html#class-node-method-unhandled-key-input), *"Called when an InputEventKey hasn't been consumed by _input or any GUI Control item"*. 
Therefore, in code, it constantly listens to an user input on the keyboard, `InputEventKey` type. To avoid constantly checking for inputs, the code uses the Button status, with the *Toggle Mode* property enabled and switching the `set_process_unhandled_input` flag whenever it is pressed.

However, what if we, as a player, wanted to use the mouse clicks or mouse wheel (Example.: Mouse wheel to scroll weapons on FPS). Or more, use a controller? With the demo project, we're unable as `_unhandled_key_input()` does not listen to other inputs. Thus one would need [`_input()`](https://docs.godotengine.org/en/stable/classes/class_node.html#class-node-method-input) or [`_unhandled_input()`](https://docs.godotengine.org/en/stable/classes/class_node.html#class-node-method-unhandled-input). And by documentation, *"For gameplay input, _unhandled_input and _unhandled_key_input are usually a better fit as they allow the GUI to intercept the events first."*

Thus in the code, it has been slightly modified to test and output the InputEvent of InputEventKey, InputEventMouseButton and InputEventJoypadButton on the console, via `_unhandled_input()`. That code is currently commented out.

A property I like about this code, besides teaching the concept of remapping inputs, is that it exports a variable named `action`, which allows the developer to set any key input defined in InputMap on the editor screen.