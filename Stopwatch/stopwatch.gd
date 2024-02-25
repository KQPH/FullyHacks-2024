extends Label

var time_elasped := 0.0

@onready var stopwatch := get_tree().get_first_node_in_group("stopwatch")

func _process(_delta):
	time_elasped += _delta
	stopwatch.text = _format_seconds(time_elasped)
	

func _format_seconds(time: float):
	var minutes := time / 60.0
	var seconds := fmod(time, 60.0)
	var milliseconds := fmod(time, 1.0) * 100.0
	
	return "%02d:%02d:%02d" % [minutes, seconds, milliseconds]
