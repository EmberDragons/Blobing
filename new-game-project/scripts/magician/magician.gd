extends Node2D

@onready var anim: AnimatedSprite2D = $animation

var blob = preload("res://gameObject/blob type/normal.tscn")
var triple_blob = preload("res://gameObject/blob type/triple.tscn")

@export var blobs_prefab  = [preload("res://gameObject/blob type/normal.tscn"),preload("res://gameObject/blob type/normal.tscn"),preload("res://gameObject/blob type/normal.tscn"),preload("res://gameObject/blob type/normal.tscn"),preload("res://gameObject/blob type/normal.tscn"),preload("res://gameObject/blob type/normal.tscn")]
#dont worry abt that hahahhaha

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

	
func spawn_blob(blob):
	"""Make a blob spawn"""
	var b = blob.instantiate()
	b.position = Vector2(128., -64.)
	if b.is_in_group("gravity"): 
		b.linear_velocity = Vector2(256., -600.)
	else :
		b.linear_velocity = Vector2(256., -800.)
	add_child(b)
	
func choose_blob():
	return blobs_prefab[randi_range(0,len(blobs_prefab)-1)]

func summon(blob):
	spawn_blob(blob)
	anim.play("summon")
	Score.score += 1
	
	scale = Vector2(0.9,0.9)
	await get_tree().create_timer(1.3).timeout
	anim.play("idle")
	scale = Vector2(1,1)
