extends RigidBody2D

var saved_velocity : Vector2



func block(m_pos) -> void:
	var t = linear_velocity
	saved_velocity = Vector2(-t.x,t.y)
	position = m_pos
	linear_velocity = Vector2.ZERO

func unblock() -> void:
	linear_velocity = saved_velocity
