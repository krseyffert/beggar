extends State

@onready var state_machine := get_node("./..")
@export var opponent_turn: State
@export var faces_in_play: State
@export var end_game: State
#@export var move_state: State
@onready var deck_button := get_node("./../../player_deck_button")

func enter():
	super()
	if GlobalParams.is_player_turn and GlobalParams.player_card_count <= 0:
		GlobalParams.player_win = false
		state_machine.change_state(end_game)
		return

	GlobalParams.is_player_turn = true
	await deck_button.player_deck_clicked
	parent.player_drawCard()

	if GlobalParams.active_card.x > 10 or GlobalParams.active_card.x == 1:
		GlobalParams.is_player_turn = false
		state_machine.change_state(faces_in_play)
		#state_machine.change_state(opponent_turn)
	else:
		state_machine.change_state(opponent_turn)



func process_input(_event: InputEvent) -> State:
	return null


func process_physics(_delta: float) -> State:

	return null

