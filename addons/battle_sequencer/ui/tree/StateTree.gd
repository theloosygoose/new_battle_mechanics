@tool
extends Tree

func _ready() -> void:
	var root = create_item()
	hide_root = true
	var child1 = create_item(root)
	var child2 = create_item(root)
	var subchild1 = create_item(child1)
	child1.set_text(0, "Child1")
	child2.set_text(0, "Child2")
	subchild1.set_text(0, "SubChild1")
	subchild1.set_custom_bg_color(0, Color.from_hsv(110, 65, 75, 0.2))

