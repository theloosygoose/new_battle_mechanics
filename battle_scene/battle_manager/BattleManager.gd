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

var states: Dictionary = {}
var current_state: EnemyState

func _ready() -> void:
	#get stages
	for child: Node in get_children():
		if child is EnemyState:
			var child_state: EnemyState = child
			print("::LOADED::")
			print(child_state.data.state_name)
			states[child_state.data.state_name.to_lower()] = child_state
			child_state.switch.connect(_on_switch)

	if initial_state:
		initial_state.start()
		current_state = initial_state

func _process(delta: float) -> void:
	if current_state:
		current_state.run(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_run(delta)

func _on_switch(state: EnemyState, new_state_name: String) -> void:
	var new_state: EnemyState

	if state == current_state:
		new_state = states.get(new_state_name.to_lower())

	if !new_state:
		print_debug(new_state_name, " :: does not exist")
		return

	if current_state:
		current_state.end()
	
	new_state.start()

	current_state = new_state
