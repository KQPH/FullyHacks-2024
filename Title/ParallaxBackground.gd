extends ParallaxBackground

var speed: int = 50
var rotation_speed = 0.4

var direction = Vector2(0, 1)

func _process(delta):
	scroll_offset += direction * speed * delta
	direction = direction.rotated(rotation_speed * delta)
