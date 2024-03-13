extends Node2D
class_name ShooterComponent



@export var input: String 
@export var projectile: PackedScene
@export var shooter_resource: ShooterResource 

#var cooldown_time:= shooter_resource.cooldown_time 
#var pattern:= shooter_resource.pattern

var can_shoot: bool = true 

func cooldown_timer() -> void:
	pass

func input_shoot() -> bool:
	if Input.is_action_pressed(input):
		return true

	return false
