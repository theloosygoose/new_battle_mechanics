extends Resource
class_name EnemyActionResource


enum EnemyActionType {
	SHOOT_PATTERN,
	IDLE,
}

@export var name: String
@export var action_type: EnemyActionType

@export_range(0, 100) var length: float


# BASIC FORMAT FOR FUNCTIONS AND DIFFERING BETWEEN ACTION TYPES
# func FunctionName(whateverparams) -> void:
#	match EnemyActionType:
#     #Then just match for every action type and have it run diff functions?

func Update(_delta: float) -> void:

	match EnemyActionType:
		EnemyActionType.SHOOT_PATTERN:
			#Shoot Function?
			pass
			
		EnemyActionType.IDLE:
			#Idle Function?
			pass
	pass


