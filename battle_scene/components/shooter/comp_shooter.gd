extends Marker2D 
class_name ShooterComponent

@export var projectile: PackedScene
@export var shooter_resource: ShooterResource 

@onready var cooldown_time: float = shooter_resource.cooldown_time 
#var pattern:= shooter_resource.pattern

#Get Shooter ResourceStats or whatever
@onready var input_type: ShooterResource.Trigger = shooter_resource.trigger
@onready var input_name: String = shooter_resource.trigger_input

@onready var target: ShooterResource.Target = shooter_resource.target
@onready var direction: ShooterResource.Direction = shooter_resource.direction 

@onready var action_area: ActionArea = get_node("%ActionArea")
@onready var player: Player = get_node("%Player")
@export var track_node: Node2D

var cooldown: bool = true 
var elapsed_time: float = 0.0

# Node Connnections
var enemy_battle_state: EnemyState 
var root: Node

var enemy_trigger: bool = false

func _ready() -> void:
	root = get_tree().root

func _process(delta: float) -> void:	
	check_cooldown(delta)

	if cooldown:
		if input_shoot():
			fire_projectile()
			cooldown = false
			elapsed_time = 0.0

	
	#reset trigger
	enemy_trigger = false
	

func input_shoot() -> bool:
	match input_type:
		ShooterResource.Trigger.PLAYER:
			if Input.is_action_pressed(input_name):
				return true

		ShooterResource.Trigger.ENEMY:
			if enemy_trigger:
				return true

		_:
			return false
	
	return false


func fire_projectile() -> void:
	var loaded: Projectile = projectile.instantiate()
	var shoot_direction: Vector2

	match direction:
		ShooterResource.Direction.UP:
			shoot_direction = Vector2.UP

		ShooterResource.Direction.DOWN:
			shoot_direction = Vector2.DOWN

		ShooterResource.Direction.LEFT:
			shoot_direction = Vector2.LEFT

		ShooterResource.Direction.RIGHT:
			shoot_direction = Vector2.RIGHT

		ShooterResource.Direction.TOWARDS_CENTER:
			# Find the Center Based on this 
			var center_direction: float = global_position.angle_to_point(action_area.bounds.global_center)
			shoot_direction = Vector2.from_angle(center_direction)

		ShooterResource.Direction.PLAYER:
			var player_direction: float = global_position.angle_to_point(player.global_position)
			shoot_direction = Vector2.from_angle(player_direction)



	loaded.position = global_position
	loaded.direction = shoot_direction
	loaded.proj_target = target

	if track_node:
		loaded.new_track(track_node) 

	root.add_child(loaded)

func check_cooldown(delta: float) -> void:
	elapsed_time += delta

	if elapsed_time >= cooldown_time:
		cooldown = true

func pull_trigger() -> void:
	enemy_trigger = true	

