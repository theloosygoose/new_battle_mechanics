extends Resource 
class_name Attack

@export var damage: float
@export var effects: Array 
@export var target: Target

enum Target {
	PLAYER,
	ENEMY,
	ALL,
	NONE,
}
