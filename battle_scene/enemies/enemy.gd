@tool
class_name Enemy
extends Node2D 

@export var battle_manager: BattleManager:
	get:
		if !check_battle_manager():
			update_configuration_warnings()

		return battle_manager
			

func _get_configuration_warnings() -> PackedStringArray:
	var message: PackedStringArray = []
	if !check_battle_manager():
		message.append("Assign a BattleManagerComponent")

	return message
	
func check_battle_manager() -> bool:
	if !battle_manager:
		return false

	return true