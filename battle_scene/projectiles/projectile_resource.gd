extends Resource
class_name ProjectileResource

@export var texture: Texture2D
@export var shader: ShaderMaterial

@export_group("Projectile Movement")
@export var linear_velocity: float
@export var scale: Vector2
@export var damage: float