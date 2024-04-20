extends Area2D 
class_name ActionArea

var player_body: Player

var current_bounds: PackedVector2Array 
var initial_bounds: PackedVector2Array

var _collision_polygon: CollisionPolygon2D

@onready var bounds: Bounds = Bounds.new()

signal bounds_changed

class Bounds:
	var up: float
	var right: float
	var left: float
	var down: float
	var center: Vector2 
	var global_center: Vector2

func _ready() -> void:
	init_get_polygon()
	update_current_bounds()

func _process(delta: float) -> void:
	change_bounds_scale(0.1 * delta)
	pass

func _on_body_exited(body:Node2D) -> void:
	if body is Player:
		print("HELLPP")

func change_bounds_scale(bounds_rescale: float) -> void:
	var new_polygon: PackedVector2Array = []

	for i in range(_collision_polygon.polygon.size()):

		new_polygon.append(_collision_polygon.polygon[i] - (_collision_polygon.polygon[i] * bounds_rescale))
	
	_collision_polygon.polygon = new_polygon

	update_current_bounds()

func update_current_bounds() -> void:
	current_bounds = _collision_polygon.polygon
	bounds_positions()
	bounds_changed.emit()
		
func init_get_polygon() -> void:
	var child := $CollisionPolygon2D 
	assert(child is CollisionPolygon2D, "child is not CollisionPolygon2D") 

	_collision_polygon = child
	initial_bounds = _collision_polygon.polygon
	

func bounds_positions() -> void:
	for position_vector in _collision_polygon.polygon:
		var x: float = position_vector.x
		var y: float = position_vector.y

		if x >= 0:
			bounds.right = x
		else:
			bounds.left = x
		if y >= 0:
			bounds.up = y
		else:
			bounds.down = y

	bounds.center.x = bounds.left + bounds.right
	bounds.center.y = bounds.up + bounds.down

	bounds.global_center.x = bounds.center.x + global_position.x
	bounds.global_center.y = bounds.center.y + global_position.y
