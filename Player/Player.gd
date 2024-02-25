extends CharacterBody2D

var movement_speed = 130.0

@onready var health = 100.0

var laserBullet = preload("res://Weapons/laser_bullet.tscn")

@onready var laserBulletTimer = get_node("%LaserBulletTimer")
@onready var laserBulletAttackTimer = get_node("%LaserBulletAttackTimer")

var laserBullet_ammo = 0
var laserBullet_baseammo = 1
var laserBullet_attackspeed = 1.5
var laserBullet_level = 1

var enemy_close = []

func _ready():
	attack()

func _physics_process(_delta):
	movement()

func movement():
	var x_mov = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_mov = Input.get_action_strength("down") - Input.get_action_strength("up")
	var mov = Vector2(x_mov, y_mov)
	velocity = mov.normalized()*movement_speed
	move_and_slide()


func _on_hurtbox_hurt(damage):
	health -= damage
	print(health)

func attack():
	if laserBullet_level > 0:
		laserBulletTimer.wait_time = laserBullet_attackspeed
		if laserBulletTimer.is_stopped():
			laserBulletTimer.start()

func _on_laser_bullet_timer_timeout():
	laserBullet_ammo += laserBullet_baseammo
	laserBulletAttackTimer

func _on_laser_bullet_attack_timer_timeout():
	if laserBullet_ammo > 0:
		var laserBullet_attack = laserBullet.instantiate()
		laserBullet_attack.position = position
		laserBullet_attack.target = get_random_target()
		laserBullet_attack.level = laserBullet_level
		add_child(laserBullet_attack)
		laserBullet_ammo -= 1
		if laserBullet_ammo > 0:
			laserBulletAttackTimer.start()
		else:
			laserBulletAttackTimer.stop()
		
func get_random_target():
	if enemy_close.size()

func _on_enemy_detection_area_body_entered(body):
	if not enemy_close.has(body):
		enemy_close.append(body)


func _on_enemy_detection_area_body_exited(body):
	if enemy_close.has(body):
		enemy_close.erase(body)
