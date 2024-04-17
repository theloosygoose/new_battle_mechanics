extends Area2D
class_name Projectile


@export var proj_data: ProjectileResource 

## How does the projectile _look?
@onready var proj_shader: ShaderMaterial = proj_data.shader
@onready var proj_scale: Vector2 = proj_data.scale

## How does the projectile move?
@onready var speed: float = proj_data.linear_velocity
@onready var damage: float = proj_data.damage
@onready var lifetime: float = proj_data.lifetime

var proj_target: ShooterResource.Target = ShooterResource.Target.ENEMY
var direction: Vector2 = Vector2.UP

var is_proj_track: bool = false

var track_data: TrackData

var lifetime_timer: Timer

class TrackData:
	var track_on: bool
	var track_node: Node 
	var prev_position: Vector2

func _ready() -> void:
	area_entered.connect(_entered_area)
	lifetime_timer = Timer.new()
	lifetime_timer.wait_time = lifetime
	lifetime_timer.one_shot = true
	lifetime_timer.timeout.connect(_lifetime_timeout)
	self.add_child(lifetime_timer)
	lifetime_timer.start()
	
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

func track(track_node: Node, prev_position: Vector2) -> void:
	is_proj_track = true
	track_data = TrackData.new()
	track_data.track_on = true
	track_data.track_node = track_node
	track_data.prev_position = prev_position

func disable_track() -> void:
	track_data.track_on = false

func enable_track() -> void:
	track_data.track_on = true

func _lifetime_timeout() -> void:
	print("All Done")
	queue_free()
