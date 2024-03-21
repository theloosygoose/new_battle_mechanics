class_name BattleManager
extends Node

var path2D_spawner: Path2D 
var action_area: ActionArea 
var enemy: Enemy

@export var enemy_actions: Array[EnemyActionResource]

@export var enemy_shot_locations: Array[ShooterComponent]

signal enemy_trigger

func _ready() -> void:
	print_rich(enemy_actions_to_dict(enemy_actions))
	print_rich(ready_shoot_locations(enemy_shot_locations))

func _process(_delta: float) -> void:
	enemy_trigger.emit()


func enemy_actions_to_dict(actions_array: Array[EnemyActionResource]) -> Dictionary:
	var dict: Dictionary = {}

	for action in actions_array:
		dict[action.name.to_lower()] = action

	return dict


func ready_shoot_locations(shot_loc_array: Array[ShooterComponent]) -> Dictionary:
	var dict: Dictionary = {}

	for shot_location in shot_loc_array:
		dict[shot_location.global_position] = shot_location
		shot_location.add_to_group("enemy_shooters")

	return dict
