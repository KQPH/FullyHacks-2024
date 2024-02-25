extends CharacterBody2D

var movement_speed = 130.0

@onready var health = 100

func _ready():
	$Healthbar.max_value = health
	set_healthbar()

func _physics_process(_delta):
	movement()
	
func set_healthbar():
	$Healthbar.value = health

func movement():
	var x_mov = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_mov = Input.get_action_strength("down") - Input.get_action_strength("up")
	var mov = Vector2(x_mov, y_mov)
	velocity = mov.normalized()*movement_speed
	move_and_slide()


func _on_hurtbox_hurt(damage):
	health -= damage
	print(health)
	set_healthbar()
	if health <= 0:
		get_tree().change_scene_to_file("res://death_screen.tscn")
