extends Node2D
@onready var fires: CPUParticles2D = $CPUParticles2D
@onready var anim: AnimationPlayer = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func burn():
	fires.emitting = true
	anim.play("burning")
	await get_tree().create_timer(0.6).timeout
	queue_free()
