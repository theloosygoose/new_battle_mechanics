@tool
extends Resource
class_name ShooterResource

enum Pattern {
	STRAIGHT,
	CONE,
}

enum Trigger {
	PLAYER,
	ENEMY
}

enum Direction {
	UP,
	DOWN,
	LEFT,
	RIGHT,
	TRACK,
	TOWARDS_CENTER,
	PLAYER
}


@export var cooldown_time: float 
@export var pattern: Pattern

@export var direction: Direction
@export var speed_override: float
@export var attack: Attack

@export_group("Trigger")
@export var trigger: Trigger
@export var _trigger_input: String


var trigger_input: String:
	get:
		if trigger == Trigger.ENEMY:
			return ""
		if trigger == Trigger.PLAYER:
			return _trigger_input

		return ""
