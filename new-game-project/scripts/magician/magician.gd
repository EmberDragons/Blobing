extends Node2D

const BLOBS = [["fire", "big", "sticky"]]
var blob = preload("res://gameObject/blob type/normal.tscn")

func spawn_blob():
	"""Make a blob spawn"""
	var b = blob.instantiate()
	b.position = Vector2(128., -64.)
	b.linear_velocity = Vector2(256., -800.)
	add_child(b)
	
func _ready() -> void:
	await get_tree().create_timer(0.4).timeout
	spawn_blob()
