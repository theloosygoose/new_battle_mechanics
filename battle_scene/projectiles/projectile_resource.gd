extends Resource
class_name ProjectileResource

## How does the projectile look?
@export var texture: Texture2D
@export var shader: ShaderMaterial


## How does the projectile move?
@export_group("Projectile Movement")
@export var linear_velocity: float
@export var scale: Vector2
@export var damage: float