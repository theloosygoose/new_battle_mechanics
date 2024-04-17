extends Node
class_name EnemyState


@export var state_data: EnemyStateData 
var child_nodes: Dictionary

func _ready() -> void:
	for child in get_children():
		child_nodes[child.name.to_lower()] = child

func ready_shoot_locations(shot_loc_array: Array[ShooterComponent]) -> Dictionary:
	var dict: Dictionary = {}

	for shot_location in shot_loc_array:
		dict[shot_location.global_position] = shot_location
		shot_location.add_to_group("enemy_shooters")

	return dict

## State that runs something
## Ran by the Battle Manager
## Returns Void
func run(delta: float) -> void:
	pass

## Physics State that runs something
## Ran by the Battle Manager
## Returns Void
func physics_run(delta: float) -> void:
	pass


## Returns when 
func start() -> bool:
	pass
