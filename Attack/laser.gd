extends Area2D

var laser_size = 1.0
var speed = 200
var damage = 30.0

var target = Vector2.ZERO
var angle = Vector2.ZERO

@onready var player = get_tree().get_first_node_in_group("player")

func _ready():
	# angle = global_position.
