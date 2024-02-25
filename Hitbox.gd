extends Area2D

# all enemies deal 10.0 damage, can change later to make it vary by enemy type
var enemyDamage = 10.0
		
@export var damage = enemyDamage

@onready var collision = $CollisionShape2D
@onready var disableTimer = $DisableHitboxTimer

func tempdisable():
	collision.call_deferred("set", "disabled", true)
	disableTimer.start()


func _on_disable_hitbox_timer_timeout():
	collision.call_deferred("set", "disabled", false)
