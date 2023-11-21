extends State

@onready var state_machine := get_node("./..")
@export var player_turn: State
@export var faces_in_play: State
@export var end_game: State
#@export var move_state: State
@onready var deck_button := get_node("./../../opponent_deck_button")

func enter():
	super()
	if !GlobalParams.is_player_turn and GlobalParams.opponent_card_count <= 0:
		GlobalParams.player_win = true
		state_machine.change_state(end_game)
		return

	GlobalParams.is_player_turn = false
	if GlobalParams.p2_cpu:
		await get_tree().create_timer(1).timeout
	else:
		await deck_button.opponent_deck_clicked
	parent.opponent_drawCard()

	if GlobalParams.active_card.x > 10 or GlobalParams.active_card.x == 1:
		GlobalParams.is_player_turn = true
		state_machine.change_state(faces_in_play)
		#state_machine.change_state(player_turn)
	else:
		state_machine.change_state(player_turn)

func process_input(_event: InputEvent) -> State:
	return null


func process_physics(_delta: float) -> State:

	return null
