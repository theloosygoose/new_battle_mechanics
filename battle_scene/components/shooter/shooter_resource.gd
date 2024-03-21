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
	TRACK	
}

enum Target {
	PLAYER,
	ENEMY,
	NONE,
}

@export var cooldown_time: float 
@export var pattern: Pattern

@export_group("Trigger")
@export var trigger: Trigger:
	set(value):
		trigger = value
		if value == Trigger.ENEMY:
			trigger_input = ""


@export var trigger_input: String:
	set(value):
		if value != "":
			trigger = Trigger.PLAYER
			trigger_input = value

		if value == "":
			trigger = Trigger.ENEMY
			trigger_input = value

@export var direction: Direction
@export var target: Target
