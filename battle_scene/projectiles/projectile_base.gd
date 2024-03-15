extends Area2D
class_name Projectile


@export var proj_data: ProjectileResource 

## How does the projectile _look?
@onready var proj_texture: Texture = proj_data.texture
@onready var proj_shader: ShaderMaterial = proj_data.shader
@onready var proj_scale: Vector2 = proj_data.scale

## How does the projectile move?
@onready var speed: float = proj_data.linear_velocity
@onready var damage: float = proj_data.damage

@onready var sprite: Sprite2D = $Sprite2D

var direction: Vector2 = Vector2.UP

func _ready() -> void:
	sprite.texture = proj_texture
	
func _physics_process(delta: float) -> void:
	var velocity: Vector2 = speed * direction
	position += delta * velocity