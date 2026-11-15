extends HBoxContainer

var l = ["a","b","c","d","e","f","g","h","i","j","k",
"l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children():
		child.text = l[randi_range(0,len(l)-1)].capitalize()
