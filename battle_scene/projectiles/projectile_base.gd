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
var track_node: Node2D

var track_data: Track

var lifetime_timer: Timer

class Track:
	var track_on: bool
	var cur_track_node: Node2D 
	var prev_position: Vector2

	func physics_update() -> void:
		if self.cur_track_node:
			self.prev_position = self.cur_track_node.global_position

	func off() -> void:
		self.track_on = false
	
	func on() -> void:
		self.track_on = true

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
	else:
		track_data.physics_update()
		direction = Vector2.from_angle(global_position.angle_to_point(track_data.prev_position))
		velocity = speed * direction
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

func new_track(_track_node: Node2D) -> void:
	track_data = Track.new()
	track_data.cur_track_node = _track_node
	track_data.on()
	is_proj_track = true

func _lifetime_timeout() -> void:
	print("All Done")
	queue_free()
