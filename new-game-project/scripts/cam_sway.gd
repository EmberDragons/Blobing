extends Node2D

var t : float = 0
var goal : Vector2
var start : Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if t<=0:
		t = randf_range(0.5,1.2)
		goal = 2*Vector2(sin(Time.get_unix_time_from_system()),-sin(Time.get_unix_time_from_system()))
		start = global_position
	global_position = lerp(start, start+goal, t)
	
	t-=delta
