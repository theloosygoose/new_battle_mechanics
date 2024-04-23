class_name CompHitbox
extends Area2D

@export var target_type: Attack.Target
@export var health_component: CompHealth 

func damage(attack: Attack) -> void:
	if health_component:
		health_component.damage(attack)
