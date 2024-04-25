extends EditorInspectorPlugin


var ui_scn: PackedScene = preload("res://addons/battle_sequencer/ui/sequence_creator.tscn")
var ui: Control

func _can_handle(object: Object) -> bool: 
	if object is Sequence:
		return true
	else:
		return false

func _parse_begin(object: Object) -> void:
	ui = ui_scn.instantiate()
	add_custom_control(ui)
