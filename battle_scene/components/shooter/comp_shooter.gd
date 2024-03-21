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

var cooldown: bool = true 
var elapsed_time: float = 0.0


# Node Connnections
var battle_manager: BattleManager
var root: Node

var enemy_trigger: bool = false


func _ready() -> void:
	root = get_tree().root

	if input_type == ShooterResource.Trigger.ENEMY:
		connect_to_enemy_trigger()



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
			var viewport_center_x: float = get_viewport().get_visible_rect().size.x / 2

			if global_position.x < viewport_center_x:
				shoot_direction = Vector2.RIGHT

			if global_position.x > viewport_center_x:
				shoot_direction = Vector2.LEFT


	loaded.position = global_position
	loaded.direction = shoot_direction
	loaded.proj_target = target

	root.add_child(loaded)


func check_cooldown(delta: float) -> void:
	elapsed_time += delta

	if elapsed_time >= cooldown_time:
		cooldown = true


func connect_to_enemy_trigger() -> void:
	if input_type == ShooterResource.Trigger.ENEMY:
		battle_manager = %BattleManager

		battle_manager.enemy_trigger.connect(_on_enemy_trigger)

func _on_enemy_trigger() -> void:
	enemy_trigger = true 

