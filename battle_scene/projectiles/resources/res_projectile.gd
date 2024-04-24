extends Resource
class_name ProjectileResource

enum ProjectileType {
	PROJECTILE,
	HITSCAN
}

## How does the projectile look?
@export var shader: ShaderMaterial
@export var projectile_type: ProjectileType
@export var lifetime: float
@export var attack: Attack

## How does the projectile move?
@export_group("Projectile Movement")
@export var linear_velocity: float
@export var scale: Vector2
@export var damage: float
