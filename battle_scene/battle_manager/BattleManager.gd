class_name BattleManager
extends Node

@export var path2D_spawner: Path2D 
@export var action_area: ActionArea 
@export var enemy: Enemy

var stages: Dictionary

var current_state: EnemyState

func _ready() -> void:
	_setup()


func _setup() -> void:
	#get stages
	for child in get_children():
		if child.is_class("EnemyState"):
			stages[child.name.to_lower()] = child


func _process(delta: float) -> void:
	if current_state:
		current_state.run(delta)
	

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_run(delta)
