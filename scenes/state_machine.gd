extends Node

@export
var starting_state: State
var current_state: State

#initialise state machine by giving each child stat a reference to the parent object,
#and entering default starting_state
func init(parent: Playspace) -> void:
	for child in get_children():
		child.parent = parent
		
	change_state(starting_state)

#change to new state by calling exit login on current stat
func change_state(new_state: State):
	if current_state:
		current_state.exit()
	
	current_state = new_state
	current_state.enter()

#Pass through functions for player to call
#handing state changes as needed
func process_physics(delta: float):
	var new_state = current_state.process_physics(delta)
	if new_state:
		change_state(new_state)

func process_input(event: InputEvent):
	var new_state = current_state.process_input(event)
	if new_state:
		change_state(new_state)


func process_frame(delta: float):
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)
