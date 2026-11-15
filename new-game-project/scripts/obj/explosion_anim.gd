extends StaticBody2D
@onready var fires: CPUParticles2D = $CPUParticles2D
@onready var cloud: CPUParticles2D = $CPUParticles2D2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("yes")
	fires.emitting = true
	cloud.emitting = true
	await get_tree().create_timer(0.8).timeout
	queue_free()
