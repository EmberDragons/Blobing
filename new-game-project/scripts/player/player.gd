extends CharacterBody2D


var speed = 600.0
var friction = 1200.0
var pos_x : float


func _ready() -> void:
	pos_x = position.x

func _physics_process(delta: float) -> void:
	position.x = pos_x
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_up", "ui_down")
	if direction:
		velocity.y = direction * speed
	else:
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction * delta)
		velocity.y = move_toward(0, velocity.y, speed)

	move_and_slide()
	
	
