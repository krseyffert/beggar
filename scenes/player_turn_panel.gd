extends Panel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = GlobalParams.is_player_turn


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	visible = GlobalParams.is_player_turn
