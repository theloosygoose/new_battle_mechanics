extends Resource
class_name EnemyStateData 


enum EnemyActionType {
	START,
	SHOOT_PATTERN,
	IDLE,
}

## Action Type of enum EnemyActionType
@export var action_type: EnemyActionType

## Order Number to be used in the Battle Manager
@export var order: int 
