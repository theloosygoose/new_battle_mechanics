@tool
class_name Enemy
extends Node2D 

@export var battle_manager: BattleManager:
	set(value):
		if value != battle_manager:
			battle_manager = value
			update_configuration_warnings()
			

func _get_configuration_warnings() -> PackedStringArray:
	var message: PackedStringArray = []
	if !check_battle_manager():
		message.append("Assign a BattleManagerComponent")

	return message
	
func check_battle_manager() -> bool:
	if !battle_manager:
		return false

	return true