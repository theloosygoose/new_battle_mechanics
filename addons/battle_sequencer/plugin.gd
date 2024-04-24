@tool
extends EditorPlugin

var insp = preload("res://addons/battle_sequencer/inspectorplugin.gd")

func _enter_tree() -> void:
	insp = insp.new()
	add_inspector_plugin(insp)

func _exit_tree() -> void:
	remove_inspector_plugin(insp)
