extends State

@export var player_turn: State
@export var faces_in_play: State
#@export var move_state: State

func enter():
	super()
	if GlobalParams.player_win:
		print("Player wins")
		get_node("./../../end_panel/end_text").text = "[b]%s[b]" % "YOU WIN"
		get_node("./../../end_panel").visible = true
		get_tree().paused = true
	else:
		print("Opponent wins")
		get_node("./../../end_panel/end_text").text = "[b]%s[b]" % "YOU LOSE"
		get_node("./../../end_panel").visible = true
		get_tree().paused = true


func process_input(_event: InputEvent) -> State:
	return null


func process_physics(_delta: float) -> State:

	return null
