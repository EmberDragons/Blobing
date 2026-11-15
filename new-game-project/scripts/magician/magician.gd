extends Node2D

var blob = preload("res://gameObject/blob type/normal.tscn")
var triple_blob = preload("res://gameObject/blob type/triple.tscn")

func spawn_normal_blob():
	"""Make a blob spawn"""
	var b = blob.instantiate()
	b.position = Vector2(128., -64.)
	b.linear_velocity = Vector2(256., -800.)
	add_child(b)
	
func spawn_triple_blob():
	"""Make a blob spawn"""
	var b = triple_blob.instantiate()
	b.position = Vector2(128., -64.)
	b.linear_velocity = Vector2(256., -800.)
	add_child(b)
	
func _ready() -> void:
	await get_tree().create_timer(0.4).timeout
	#spawn_normal_blob()
	#await get_tree().create_timer(4.0).timeout
	spawn_triple_blob()
	
