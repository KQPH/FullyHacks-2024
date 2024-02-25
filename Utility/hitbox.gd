extends Area2D

@export var damage = 10.0

@onready var collision = $CollisionShape2D
@onready var disableHitboxTimer = $disableHitboxTimer

func tempdisable():
	collision.call_deferred("set", "disabled", true)
	disableHitboxTimer.start()

func _on_disable_hitbox_timer_timeout():
	collision.call_deferred("set", "disabled", false)
