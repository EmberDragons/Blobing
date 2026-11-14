class_name slime
extends RigidBody2D

var saved_velocity : Vector2
var max_velocity : float = 1000
var mult : float = 1.4

var follow:bool = false
var object_follow

func _ready() -> void:
	linear_velocity += Vector2(1000,0)


func _process(delta: float) -> void:
	if follow: following(object_follow) 

func following(o:Node2D):
	global_position = o.global_position

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
