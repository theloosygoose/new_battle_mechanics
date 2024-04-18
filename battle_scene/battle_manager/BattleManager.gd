extends Node
class_name BattleManager

@export_group("Resources")
@export var path2D_spawner: Path2D 
@export var action_area: ActionArea 
@export var enemy: Enemy


@export_group("Initial State")
@export var initial_state_type: InitialStateType
@export var initial_state: EnemyState

enum InitialStateType{
	RANDOM,
	SET,
}

var states: Dictionary
var current_state_name: String 

var current_state: EnemyState

func _ready() -> void:
	_setup()

func _setup() -> void:
	#get stages
	for child in get_children():
		if child.is_class("EnemyState"):
			var child_state: EnemyState = child
			states[child_state.data.state_name.to_lower()] = child

	current_state = states[initial_state.data.state_name.to_lower()]

func _process(delta: float) -> void:
	if current_state:
		current_state.run(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_run(delta)

func _on_switch(new_state_name: String) -> void:
	if current_state:
		current_state_name = new_state_name
		current_state = states.get(new_state_name)

