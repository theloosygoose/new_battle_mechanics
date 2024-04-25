@tool
extends Control
class_name SequenceCreator


var edited_control = null
var has_refreshed = false

func _ready() -> void:
	var selector := ManagerPicker.new()
	var sp := HSeparator.new()

	var main_panel := find_child("Main")
	print(main_panel)
	main_panel.add_child(selector)
	main_panel.move_child(selector, 0)
	main_panel.add_child(sp)
	main_panel.move_child(sp, 1)
