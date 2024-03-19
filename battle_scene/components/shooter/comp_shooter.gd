extends Node2D
class_name ShooterComponent


@export var input_type: Trigger
enum Trigger{
	PLAYERTRIGGER,
	ENEMYTRIGGER
}

@export var player_input: String 

@export var projectile: PackedScene
@export var shooter_resource: ShooterResource 

@onready var cooldown_time: float = shooter_resource.cooldown_time 
#var pattern:= shooter_resource.pattern


var can_shoot: bool = true 
var elapsed_time: float = 0.0

var root: Node

func _ready() -> void:
	root = get_tree().root

func _process(delta: float) -> void:	
	check_cooldown(delta)

	if can_shoot:
		if input_shoot():

			fire_projectile()
			can_shoot = false
			elapsed_time = 0.0
	

func input_shoot() -> bool:
	match input_type:
		Trigger.PLAYERTRIGGER:
			if Input.is_action_pressed(player_input):
				return true

		Trigger.ENEMYTRIGGER:
				return true

		_:
			return false
	
	return false



func fire_projectile() -> void:
	var loaded: Projectile = projectile.instantiate()

	loaded.position = global_position
	root.add_child(loaded)

func check_cooldown(delta: float) -> void:
	elapsed_time += delta

	if elapsed_time >= cooldown_time:
		can_shoot = true

