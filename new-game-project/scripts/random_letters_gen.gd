extends HBoxContainer

@export var blob = preload("res://gameObject/blob type/triple.tscn")

var l = ["a","c","d","e","f","g",
"q","r","s","t","w","x","z"]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children():
		child.text = l[randi_range(0,len(l)-1)].capitalize()
