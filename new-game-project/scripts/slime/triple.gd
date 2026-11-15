extends RigidBody2D

var saved_velocity : Vector2
var max_velocity : float = 1000
var mult : float = 1.4

var follow:bool = false
var object_follow

var small_blob = preload("res://gameObject/blob type/small.tscn")

func _ready() -> void:
	linear_velocity += Vector2(1000,0)

func spawn_small_blob(dir: int):
	"""Make a small blob spawn
	dir :
		0 -> left
		1 -> center
		2 -> right"""
	var b = small_blob.instantiate()
	var p = global_position
	var v = get_node(^"/root/scene/magician/triple").linear_velocity
	
	b.position = p
	b.linear_velocity = v
	
	if dir == 0:
		b.position += Vector2(0., 100.)
		b.linear_velocity += Vector2(0., 200.)
	elif dir == 2:
		b.position -= Vector2(0., 100.)
		b.linear_velocity -= Vector2(0., 200.)
	
	print(b.linear_velocity)
	if b.linear_velocity.x <= 0.:
		b.linear_velocity -= Vector2(1200., 0.)
	
	get_tree().current_scene.add_child(b)

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_LEFT:
			spawn_small_blob(0)
			spawn_small_blob(1)
			spawn_small_blob(2)
			die()

func _process(delta: float) -> void:
	if follow: following(object_follow) 

func following(o:Node2D):
	global_position = o.global_position
#
func block(pos_follow) -> void:
	var t = linear_velocity
	saved_velocity = Vector2(-abs(t.x),t.y)
	linear_velocity = Vector2.ZERO
	
	freeze = true
	follow = true
	object_follow=pos_follow

func unblock() -> void:
	follow = false
	freeze = false
	linear_velocity = saved_velocity
	#acceleration
	linear_velocity = Vector2(min(max_velocity,abs(linear_velocity.x*mult))*(int(linear_velocity.x>0)-0.5)*2,
	min(max_velocity,abs(linear_velocity.y*mult))*(int(linear_velocity.y>0)-0.5)*2)

func die():
	queue_free()

func _on_body_collided(body: Node) -> void:
	#acceleration et rebonds
	linear_velocity = Vector2(min(max_velocity,abs(linear_velocity.x*mult))*(int(linear_velocity.x>0)-0.5)*2,
	min(max_velocity,abs(linear_velocity.y*mult))*(int(linear_velocity.y>0)-0.5)*2)
