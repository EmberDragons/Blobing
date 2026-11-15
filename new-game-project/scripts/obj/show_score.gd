extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = str(Score.score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		var c = Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)
		if c:
			if Score.level == 1:
				get_tree().change_scene_to_file("res://scenes/level_2.tscn")
			elif Score.level == 2:
				get_tree().change_scene_to_file("res://scenes/level_3.tscn")
			elif Score.level == 3:
				get_tree().change_scene_to_file("res://scenes/credits.tscn")
			Score.level += 1
