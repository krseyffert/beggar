extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text="[center]%s[/center]" % str(GlobalParams.player_card_count)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	text="[center]%s[/center]" % str(GlobalParams.player_card_count)
