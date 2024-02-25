extends CharacterBody2D

@export var movement_speed = 70.0
@export var health = 60.0

@onready var player = get_tree().get_first_node_in_group("player")

func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * movement_speed
	move_and_slide()

func _process(delta):
	if player:
		rotation = position.angle_to(player.global_position) - deg_to_rad(90) 
		
