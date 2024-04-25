@tool
extends EditorPlugin

var insp: EditorInspectorPlugin

func _enter_tree() -> void:
	insp = preload("res://addons/battle_sequencer/inspectorplugin.gd").new()
	add_inspector_plugin(insp)

func _exit_tree() -> void:
	remove_inspector_plugin(insp)
