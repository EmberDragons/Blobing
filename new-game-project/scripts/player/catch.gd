extends Node2D

@onready var slime_pos: Node2D = $slime_pos

@export var time_throw : float = 0.3
@onready var anim: AnimatedSprite2D = $"../AnimatedSprite2D"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_ball_touch(body: Node2D) -> void:
	#we catched a ball
	if body.has_method("block"):
		body.block(slime_pos)
		anim.play("shoot")
		await get_tree().create_timer(time_throw).timeout
		body.unblock()
