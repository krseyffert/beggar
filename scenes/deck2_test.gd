extends TextureButton
signal opponent_deck_clicked

@onready var playspace = get_tree().get_current_scene()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if GlobalParams.opponent_card_count <= 0 :
		self.disabled = true
	elif GlobalParams.opponent_card_count > 0 :
		self.disabled = false
	else:
		pass


#func _on_gui_input(event: InputEvent) -> void:



func _on_button_up() -> void:
	print("opponent deck clicked")
	emit_signal("opponent_deck_clicked")

