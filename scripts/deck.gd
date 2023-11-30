extends TextureButton
signal player_deck_clicked

@onready var playspace = get_tree().get_current_scene()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if GlobalParams.player_card_count <= 0 :
		self.disabled = true
	elif GlobalParams.player_card_count > 0 :
		self.disabled = false
	else:
		pass



#func _on_gui_input(event: InputEvent) -> void:



func _on_button_up() -> void:
	print("Player deck clicked")
	emit_signal("player_deck_clicked")
