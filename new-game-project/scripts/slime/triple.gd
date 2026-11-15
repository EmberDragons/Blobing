extends RigidBody2D

var saved_velocity : Vector2
var max_velocity : float = 1000
var mult : float = 1.4

var follow:bool = false
var object_follow

var jean = preload("res://gameObject/blob type/jean.tscn")
var eude = preload("res://gameObject/blob type/eude.tscn")
var philippe = preload("res://gameObject/blob type/philippe.tscn")

func _ready() -> void:
	linear_velocity += Vector2(1000,0)
	
func spawn_jean():
	"""Make Jean spawn"""
	var jn = jean.instantiate()
	var p = global_position
	var v = get_node(^"/root/scene/magician/triple").linear_velocity
	jn.position = p + Vector2(0., 100.)
	jn.linear_velocity = v + Vector2(0., 200.)
	if jn.linear_velocity.x <= 0.:
		jn.linear_velocity -= Vector2(1200., 0.)
	get_tree().current_scene.add_child(jn)
	
func spawn_eude():
	"""Make Eude spawn"""
	var ee = eude.instantiate()
	var p = global_position
	var v = get_node(^"/root/scene/magician/triple").linear_velocity
	ee.position = p
	ee.linear_velocity = v
	if ee.linear_velocity.x <= 0.:
		ee.linear_velocity -= Vector2(1200., 0.)
	get_tree().current_scene.add_child(ee)
	
func spawn_philippe():
	"""Make Philippe spawn"""
	var pe = philippe.instantiate()
	var p = global_position
	var v = get_node(^"/root/scene/magician/triple").linear_velocity
	pe.position = p - Vector2(0., 100.)
	pe.linear_velocity = v - Vector2(0., 200.)
	if pe.linear_velocity.x <= 0.:
		pe.linear_velocity -= Vector2(1200., 0.)
	get_tree().current_scene.add_child(pe)

func _unhandled_input(event):
	if event is InputEventKey:
		if event.is_action_pressed("activate"):
			spawn_jean()
			spawn_eude()
			spawn_philippe()
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
	var sound = get_node(^"/root/scene/blob")
	sound.play()
	linear_velocity = Vector2(min(max_velocity,abs(linear_velocity.x*mult))*(int(linear_velocity.x>0)-0.5)*2,
	min(max_velocity,abs(linear_velocity.y*mult))*(int(linear_velocity.y>0)-0.5)*2)
