@tool
extends Node2D


@export var x_factor: float = 1
@export var y_factor: float = 1
@export var radi: float = 80
@onready var color = Color(1.0, 0.0, 0.0)
@export var degrees: float = 160
var angle = deg_to_rad(degrees)
var oval_angle_vector = Vector2()
@onready var radiusx = radi*x_factor
@onready var radiusy = radi*y_factor









# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _draw():
	if Engine.is_editor_hint():
		var radius: float = 80
		draw_set_transform(Vector2.ZERO,0,Vector2(x_factor,y_factor))
		draw_circle(Vector2.ZERO, radius, color)




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	self.queue_redraw()
