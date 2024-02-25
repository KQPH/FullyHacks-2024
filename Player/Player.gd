extends CharacterBody2D

var movement_speed = 130.0

@onready var health = get_tree().get_first_node_in_group("healthbar")

func _physics_process(_delta):
	movement()
	
func movement():
	var x_mov = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_mov = Input.get_action_strength("down") - Input.get_action_strength("up")
	var mov = Vector2(x_mov, y_mov)
	velocity = mov.normalized()*movement_speed
	move_and_slide()
