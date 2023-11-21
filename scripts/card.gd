extends Control
class_name Card

#int for easy calculations, ace=1,j=11,q=12,k=13
var value: int = 0
var suit: int = 0

var card_front: int = 0
@export var card_back: int = 0

@export var current_face_up: bool = false
#int for easy calculations, spades=0,diamonds=1,clubs=2,hearts=3

@onready var sprite_chooser:=$AnimatedSprite2D
@onready var animation_player := $AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	switch_card_style()
	card_front = value+(suit*13)
	if current_face_up:
		sprite_chooser.set_frame_and_progress(card_front,0.0)
	else:
		sprite_chooser.set_frame_and_progress(card_back,0.0)
	#sprite_chooser.set_frame_and_progress(card_front,0.0)
	animation_player.play("flip")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

#func _init(value: int, suit:int) -> void:
#	self.value = value
#	self.suit = suit

func darken() -> void:
	animation_player.play("darken")

func face_up(fup: bool) -> void:
	current_face_up = fup
	if fup:
		sprite_chooser.set_frame_and_progress(card_front,0.0)
	else:
		sprite_chooser.set_frame_and_progress(card_back,0.0)


func switch_card_style() -> void:
	var frame = sprite_chooser.frame
	if GlobalParams.alt_cards:
		sprite_chooser.scale = Vector2(2.75,2.75)
		sprite_chooser.play("style_02",0.0,false)
		sprite_chooser.set_frame_and_progress(frame,0.0)
	else:
		sprite_chooser.scale = Vector2(1,1)
		sprite_chooser.play("style_01",0.0,false)
		sprite_chooser.set_frame_and_progress(frame,0.0)


