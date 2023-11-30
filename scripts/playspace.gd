extends Node2D
class_name Playspace

signal card_played

@onready var card = preload("res://scenes/card.tscn")
@onready var pile_position = $pile_position
@onready var pile = $pile
@onready var scene_tree = get_tree()
@onready var current_scene = scene_tree.get_current_scene()
@onready var card_controller = $card_controller
@onready var state_machine = $state_machine

#@export var player_hand = 26
#@export var opponent_hand = 26
var current_card: Card = null

#var royal_max: int = 100
#var royal_current: int = 0
#var royal_check: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	state_machine.init(self)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


#Rendering functions
#opponent card draw actions
func player_drawCard() -> void:
	var new_card = card_controller.player_draw()
	GlobalParams.active_card = new_card
	draw_card(new_card.x, new_card.y)

#opponent card draw actions
func opponent_drawCard() -> void:
	var new_card = card_controller.opponent_draw()
	GlobalParams.active_card = new_card
	draw_card(new_card.x, new_card.y)

#function to handle the visuals of drawing a card
func draw_card(value: int, suit: int) -> void:

	if current_card != null:
		current_scene.remove_child(current_card)
		pile.add_child(current_card)
		current_card.scale = Vector2(1,1)
		current_card.face_up(true)
		current_card.darken()

#	print("values generated")
	var new_card = card.instantiate()
#	print("card instantiated",str(value),str(suit))
	new_card.value = value
	new_card.suit = suit
	new_card.current_face_up = false

	var oval_angle_vector = Vector2(pile_position.radiusx* cos(pile_position.angle), -pile_position.radiusy * sin(pile_position.angle))
	new_card.position = pile_position.position + oval_angle_vector
	new_card.rotation += deg_to_rad(randf_range(-3.1,3.1))
	pile_position.angle -= randf_range(-1.3, 1.3)
	current_card = new_card
	current_scene.add_child(new_card)
	emit_signal("card_played")


func game_end():
		print("game over")
		get_tree().paused = true



func _on_check_button_toggled(button_pressed: bool) -> void:
	GlobalParams.p2_cpu = button_pressed


func _on_card_controller_scooped() -> void:
	for _i in pile.get_children():
		print("scooping ", _i.value)
		_i.queue_free()
	current_card.darken()
	await get_tree().create_timer(0.5).timeout
	current_card.face_up(true)
	current_card.queue_free()
	pass # Replace with function body.
