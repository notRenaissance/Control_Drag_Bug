extends TextureFrame

export(int)    var itemid = 0

const Drag  = preload("res://drag.gd")

func _ready():
	pass

func get_drag_data(p):
	var stack = Drag.new()
	var object = [self, stack]
	remove_child(stack)
	var drag_preview = Drag.new()
	drag_preview.set_size(Vector2(32, 32))
	set_drag_preview(drag_preview)
	return object
