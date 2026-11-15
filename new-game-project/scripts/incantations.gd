extends Control

@onready var countainer: HBoxContainer = $HBoxContainer
@export var l_anim: Array[AnimationPlayer]



@export var t_press_col = Color.LIME_GREEN
@export var t_idle_col = Color.WEB_GRAY

var l_pos = [0,0,0,0]

var time_left:float = 1

func _ready() -> void:
	reset()

func reset():
	for j in range(len(l_pos)):
		reset_s(j)
		l_pos = [0,0,0,0]

func reset_s(k):
	var l = countainer.get_child(k).get_child(-1)
	for i in range(len(l.get_children())):
		l.get_child(i).get_label_settings().font_color = t_idle_col

func _process(delta: float) -> void:
	for j in range(len(l_pos)):
		if l_pos[j]>3:
			#finished
			var l = countainer.get_child(j).get_child(-1)
			for i in range(len(l.get_children())):
				l.get_child(i).get_label_settings().font_color = t_idle_col
			l_pos[j] = 0
			#spawn thinggy from j
			l_anim[j].play("finish")
			
	time_left -= delta
	if time_left<=0:
		time_left= 0
		reset()




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed:
			for i in range(len(countainer.get_children())):
				var l = countainer.get_child(i).get_child(-1)
				if l.get_child(l_pos[i]).text == OS.get_keycode_string(event.keycode):
					l.get_child(l_pos[i]).get_label_settings().font_color = t_press_col
					l_pos[i]+=1
					time_left=1
				else:
					l_pos[i]=0
					reset_s(i)
