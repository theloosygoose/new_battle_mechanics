extends EditorInspectorPlugin

func _can_handle(object: Object) -> bool: 
	if object is Sequence || StateGroup:
		return true

	else:
		return false


func _parse_begin(object: Object) -> void:
	var label = Label.new()
	label.set_text("Example")
	add_custom_control(label)
