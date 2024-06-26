extends Resource
class_name EnemyStateData 


enum EnemyActionType {
	START,
	SHOOT_PATTERN,
	IDLE,
}

## Name for the State
@export var state_name: String

## Name for State to switch to on completion
@export var switch_state: String

## Action Type of enum EnemyActionType
# @export var action_type: EnemyActionType

## Order Number to be used in the Battle Manager
## experimental
# @export var order: int 
