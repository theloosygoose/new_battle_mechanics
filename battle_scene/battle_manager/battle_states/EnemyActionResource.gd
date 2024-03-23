extends Resource
class_name EnemyActionResource


enum EnemyActionType {
	SHOOT_PATTERN,
	IDLE,
}

@export var name: String
@export var action_type: EnemyActionType
@export var test: String

@export_range(0, 100) var length: float

func Update(_delta: float) -> void:

	match EnemyActionType:
		EnemyActionType.SHOOT_PATTERN:
			#Shoot Function?
			pass
			
		EnemyActionType.IDLE:
			#Idle Function?
			pass
	pass

