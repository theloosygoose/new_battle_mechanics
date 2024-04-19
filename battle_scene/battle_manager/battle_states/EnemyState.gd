class_name EnemyState
extends Node
## EnemyState requires it to be a child of BattleManager to be used
## Signals :
## switch(next_state: String) 

@export var data: EnemyStateData 
var child_nodes: Dictionary

## signal to the BattleManager what state to switch to
##
## state -> EnemyState
## next_state -> String 
signal switch(state: EnemyState, next_state: String) 

## end the emit a signal to BattleManager that the state is ended 
#signal is_ended()
func _ready() -> void:
	# Get the children of the state
	for child in get_children():
		child_nodes[child.name.to_lower()] = child

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

## Ran at the beginning of the state 
func start() -> void:
	pass

## Ran at the end of the state
func end() -> void:
	pass
