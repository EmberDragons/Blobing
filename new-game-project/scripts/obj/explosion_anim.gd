extends StaticBody2D
@onready var fires: CPUParticles2D = $CPUParticles2D
@onready var cloud: CPUParticles2D = $CPUParticles2D2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fires.emitting = true
	cloud.emitting = true
	await get_tree().create_timer(0.8).timeout
	queue_free()



func inside(body: Node2D) -> void:
	if (body.is_in_group("blob")):
		body.linear_velocity += 5*(body.position-position).normalized()*(16-sqrt((body.position.x-position.x)**2+(body.position.x-position.x)**2))
