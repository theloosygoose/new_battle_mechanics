class_name Sequence extends Resource

enum Conditions{
	TIMER,
	ENEMY_HEALTH,
	PLAYER_HEALTH,
}

@export var groups: Array[StateGroup]
@export var name: String = ""
