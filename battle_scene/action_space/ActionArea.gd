extends Area2D 
class_name ActionArea

var player_body: Player

var current_bounds: PackedVector2Array 
var initial_bounds: PackedVector2Array

var _collision_polygon: CollisionPolygon2D

var bounds: Dictionary

signal bounds_changed(new_bounds: Dictionary)

func _ready() -> void:
	init_get_polygon()
	update_current_bounds()

func _process(_delta: float) -> void:
#	change_bounds_scale(0.2 * delta)
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
	bounds_changed.emit(bounds_positions())
		
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
			dict["right"] = x
		else:
			dict["left"] = x
		if y >= 0:
			dict["upper"] = y
		else:
			dict["lower"] = y
			
	print_rich(dict)	
		
	return dict
