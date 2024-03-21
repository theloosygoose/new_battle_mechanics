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

var proj_target: ShooterResource.Target = ShooterResource.Target.ENEMY
var direction: Vector2 = Vector2.UP

var is_proj_track: bool = false

class TrackData:
	var track_on: bool
	var track_node: Node 
	var prev_position: Vector2


func _ready() -> void:
	sprite.texture = proj_texture
	area_entered.connect(_entered_area)
	
func _physics_process(delta: float) -> void:
	var velocity: Vector2

	if !is_proj_track:
		velocity= speed * direction
		rotation_degrees = rad_to_deg(direction.angle()) - 90


	position += delta * velocity
	
func _entered_area(area: Area2D) -> void:
	var entered_hitbox_target_accept: ShooterResource.Target 

	if area is CompHitbox:
		var hitbox: CompHitbox = area 
		entered_hitbox_target_accept = hitbox.target_type

		match proj_target:

			ShooterResource.Target.ENEMY:
				if entered_hitbox_target_accept == ShooterResource.Target.ENEMY:
					print("Bullet Hit Enemy")
					queue_free()

			ShooterResource.Target.PLAYER:
				if entered_hitbox_target_accept == ShooterResource.Target.PLAYER:
					print("Bullet Hit Player")
					queue_free()
	else:
		pass

func track() -> void:
	is_proj_track = true
