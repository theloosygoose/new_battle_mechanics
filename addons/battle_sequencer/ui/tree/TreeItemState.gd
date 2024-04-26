@tool
extends TreeItem
class_name TreeItemState


func _ready() -> void:
	connect("focus_entered", _on_focused)

func _on_focused() -> void:
	pass
