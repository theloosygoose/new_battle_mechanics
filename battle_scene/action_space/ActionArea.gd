extends Area2D 
class_name ActionArea

var player_body: Player

var current_bounds: PackedVector2Array 
var initial_bounds: PackedVector2Array

var _collision_polygon: CollisionPolygon2D

var current_bounds_dict: Dictionary


signal bounds_changed

func _ready() -> void:
	init_get_polygon()
	update_current_bounds()

func _on_body_exited(body:Node2D) -> void:
	if body is Player:
		print("HELLPP")

func change_bounds_scale(bounds_rescale: Vector2) -> void:
	for bounds_vector in _collision_polygon.polygon:
		bounds_vector = bounds_vector * bounds_rescale 

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
	

func bounds_positions() -> Dictionary:
	var dict: Dictionary = {}
	
	for position_vector in _collision_polygon.polygon:
		var x: float = position_vector.x
		var y: float = position_vector.y

		if x >= 0:
			dict["Right"] = x
		else:
			dict["Left"] = x
		if y >= 0:
			dict["Upper"] = y
		else:
			dict["Lower"] = y
			
	print_rich(dict)	
		
	return dict