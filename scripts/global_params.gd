extends Node



var active_card: Vector2 = Vector2.ZERO
var is_player_turn: bool = true
var player_win = false
var player_card_count: int = 1000
var opponent_card_count: int = 1000
var p2_cpu: bool = false


var alt_cards: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
