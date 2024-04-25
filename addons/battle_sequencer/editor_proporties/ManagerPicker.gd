@tool
extends EditorProperty
class_name ManagerPicker

var _node_selector = EditorResourcePicker.new()
var loaded_sequence: Sequence

var updating: bool = false
func _ready() -> void:
	label = "Loaded Sequence"
	layout_direction = Control.LAYOUT_DIRECTION_LTR
	_node_selector.base_type = "Sequence"
	_node_selector.editable = true
	_node_selector.resource_changed.connect(_on_prop_update)

	add_child(_node_selector)
	add_focusable(_node_selector)


func _update_property() -> void:
	var new_value = get_edited_object()[get_edited_property()]
	if new_value == loaded_sequence:
		return

	updating = true
	loaded_sequence = new_value
	updating = false

func _on_prop_update(res: Resource) -> void:
	if updating:
		return

	loaded_sequence = res
	emit_changed(get_edited_property(), loaded_sequence)
