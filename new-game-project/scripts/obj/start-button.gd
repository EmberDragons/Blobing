extends Polygon2D

var main = preload("res://scenes/main.tscn").instantiate()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var c = Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)
	if c:
		add_child(main)
	
	
