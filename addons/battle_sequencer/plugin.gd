@tool
extends EditorPlugin

var SequencePanel = preload("res://addons/battle_sequencer/ui/sequence_creator.tscn")
var main_panel_instance: SequenceCreator 

func _enter_tree() -> void:
	main_panel_instance = SequencePanel.instantiate()
	EditorInterface.get_editor_main_screen().add_child(main_panel_instance)

	_make_visible(false)

func _exit_tree() -> void:
	if main_panel_instance:
		main_panel_instance.queue_free()

func _has_main_screen() -> bool:
	return true

func _make_visible(visible: bool) -> void:
	if main_panel_instance:
		main_panel_instance.visible = visible

func _get_plugin_name() -> String:
	return "Sequence Creator"

func _get_plugin_icon() -> Texture2D:
	return EditorInterface.get_editor_theme().get_icon("Node", "EditorIcons")
