extends Area2D
class_name Projectile


@export var proj_data: ProjectileResource 

## How does the projectile _look?
@onready var texture:Texture2D = proj_data.texture
@onready var shader:ShaderMaterial = proj_data.shader

## How does the projectile move?
@onready var speed: float = proj_data.linear_velocity
@onready var proj_scale: Vector2 = proj_data.scale
@onready var damage: float = proj_data.damage

var direction: Vector2

func _ready() -> void:
	print_debug("Created new bullett")
	
func _physics_process(delta: float) -> void:
	var velocity: Vector2 = speed * direction
	position += delta * velocity
	