extends State

@onready var state_machine := get_node("./..")
@onready var opponent_deck_button := get_node("./../../opponent_deck_button")
@onready var player_deck_button := get_node("./../../player_deck_button")
@onready var card_controller := get_node("./../../card_controller")
@export var player_turn: State
@export var opponent_turn: State
@export var end_game: State
#@export var move_state: State

var current_count : int = 0
var max_tries : int = 4

func enter():
	current_count = 0
	max_tries = 4
	super()
	if GlobalParams.active_card.x == 1:
		max_tries = 4
	else:
		max_tries = int(GlobalParams.active_card.x)-10
	print("max cards to be played: ", str(max_tries))
	
	while current_count < max_tries:
		print("i :", str(current_count))
		if GlobalParams.is_player_turn:
			if GlobalParams.player_card_count == 0:
				GlobalParams.player_win = false
				state_machine.change_state(end_game)
			await player_deck_button.player_deck_clicked
			parent.player_drawCard()
		else:
			if GlobalParams.opponent_card_count == 0:
				GlobalParams.player_win = true
				state_machine.change_state(end_game)
			if GlobalParams.p2_cpu:
				await get_tree().create_timer(1).timeout
			else:
				await opponent_deck_button.opponent_deck_clicked
			parent.opponent_drawCard()
		
		if GlobalParams.active_card.x > 10 or GlobalParams.active_card.x == 1:
			GlobalParams.is_player_turn = not GlobalParams.is_player_turn
			if GlobalParams.active_card.x == 1:
				max_tries = 4
			else:
				max_tries = int(GlobalParams.active_card.x)-10
			current_count = -1
			print("Current_count :", str(current_count))
		current_count += 1
	print("Hand Over, player won?",str(!GlobalParams.is_player_turn))
	if not GlobalParams.is_player_turn:
		card_controller.player_scoop()
		state_machine.change_state(player_turn)
	else:
		card_controller.opponent_scoop()
		state_machine.change_state(opponent_turn)


func process_input(_event: InputEvent) -> State:
	return null


func process_physics(_delta: float) -> State:
	return null
