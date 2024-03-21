class_name BattleManager
extends Node

var path2D_spawner: Path2D 
var action_area: ActionArea 
var enemy: Enemy

@export var enemy_actions: Array[EnemyActionResource]

func _ready() -> void:
	print_rich(enemy_actions_to_dict(enemy_actions))

func _process(_delta: float) -> void:
	pass

func enemy_actions_to_dict(actions_array: Array[EnemyActionResource]) -> Dictionary:
	var dict: Dictionary = {}

	for action in actions_array:
		dict[action.name.to_lower()] = action

	return dict
