extends Area2D
class_name Projectile

@export var data: ProjectileResource 

## How does the projectile _look?
@onready var proj_shader: ShaderMaterial = data.shader
@onready var proj_scale: Vector2 = data.scale

var damage: float 
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
	lifetime_timer.wait_time = data.lifetime
	lifetime_timer.one_shot = true
	lifetime_timer.timeout.connect(_lifetime_timeout)
	self.add_child(lifetime_timer)
	lifetime_timer.start()

	
func _physics_process(delta: float) -> void:
	var velocity: Vector2

	if !is_proj_track:
		velocity = data.linear_velocity * direction
		rotation_degrees = rad_to_deg(direction.angle()) - 90
	else:
		track_data.physics_update()
		var direction_to_target:Vector2 = Vector2.from_angle(global_position.angle_to_point(track_data.prev_position))
		direction += direction_to_target
		velocity = data.linear_velocity * direction
		rotation_degrees = rad_to_deg(direction.angle()) - 90

	position += delta * velocity
	
func _entered_area(area: Area2D) -> void:
	var entered_hitbox_target_accept: Attack.Target 

	if area is CompHitbox:
		var hitbox: CompHitbox = area 
		entered_hitbox_target_accept = hitbox.target_type

		match data.attack.target:
			Attack.Target.ENEMY:
				if entered_hitbox_target_accept == Attack.Target.ENEMY:
					hitbox.damage(data.attack)
					print("Bullet Hit Enemy")
					queue_free()

			Attack.Target.PLAYER:
				if entered_hitbox_target_accept == Attack.Target.PLAYER:
					hitbox.damage(data.attack)
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
