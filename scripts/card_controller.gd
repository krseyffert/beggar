extends Node
signal scooped

@onready var deck = [
	Vector2(1,0),Vector2(2,0),Vector2(3,0),Vector2(4,0),Vector2(5,0),Vector2(6,0),Vector2(7,0),Vector2(8,0),Vector2(9,0),Vector2(10,0),Vector2(11,0),Vector2(12,0),Vector2(13,0),
	Vector2(1,1),Vector2(2,1),Vector2(3,1),Vector2(4,1),Vector2(5,1),Vector2(6,1),Vector2(7,1),Vector2(8,1),Vector2(9,1),Vector2(10,1),Vector2(11,1),Vector2(12,1),Vector2(13,1),
	Vector2(1,2),Vector2(2,2),Vector2(3,2),Vector2(4,2),Vector2(5,2),Vector2(6,2),Vector2(7,2),Vector2(8,2),Vector2(9,2),Vector2(10,2),Vector2(11,2),Vector2(12,2),Vector2(13,2),
	Vector2(1,3),Vector2(2,3),Vector2(3,3),Vector2(4,3),Vector2(5,3),Vector2(6,3),Vector2(7,3),Vector2(8,3),Vector2(9,3),Vector2(10,3),Vector2(11,3),Vector2(12,3),Vector2(13,3)]

var player_hand
var opponent_hand
var pile = []

func _ready() -> void:
	randomize()
	deck.shuffle()
	player_hand = deck.slice(0, deck.size()/2)
	opponent_hand = deck.slice(deck.size()/2, deck.size())
	GlobalParams.player_card_count = player_hand.size()
	GlobalParams.opponent_card_count= opponent_hand.size()
	print(player_hand)

func player_scoop() -> void:
	player_hand.append_array(pile)
	GlobalParams.player_card_count = player_hand.size()
	print(player_hand)
	print(GlobalParams.player_card_count)
	emit_signal("scooped")
	pile = []
	await get_tree().create_timer(1).timeout

func opponent_scoop() -> void:
	opponent_hand.append_array(pile)
	GlobalParams.opponent_card_count= opponent_hand.size()
	print(opponent_hand)
	print(GlobalParams.opponent_card_count)
	emit_signal("scooped")
	pile = []
	await get_tree().create_timer(1).timeout

func player_draw() -> Vector2:
	var card = player_hand.pop_front( )
	pile.append(card)

	GlobalParams.active_card = card
	GlobalParams.player_card_count = player_hand.size()
	print("Player cards: ", GlobalParams.player_card_count, " Opponent cards: ", GlobalParams.opponent_card_count)
	if card == null:
		return Vector2.ZERO
	else:
		return card

func opponent_draw() -> Vector2:
	var card = opponent_hand.pop_front( )
	pile.append(card)

	GlobalParams.active_card = card
	GlobalParams.opponent_card_count= opponent_hand.size()
	print("Player cards: ", GlobalParams.player_card_count, " Opponent cards: ", GlobalParams.opponent_card_count)
	if card == null:
		return Vector2.ZERO
	else:
		return card
