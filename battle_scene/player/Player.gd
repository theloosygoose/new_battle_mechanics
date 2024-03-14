extends Area2D 
class_name Player

@export var character_resource: CharacterResource
@export var action_area: ActionArea

@onready var speed: float = character_resource.speed

var bounds: Dictionary


func _ready() -> void:
	for child in get_children():
		if child is Sprite2D:
			var sprite2D: Sprite2D = child
			sprite2D.texture = character_resource.sprite
			
			
	action_area.bounds_changed.connect(_on_action_area_bounds_changed)
	

func _physics_process(delta: float) -> void:
	var direction: Vector2 = get_direction()
	var velocity: Vector2 = direction * speed
	
	var new_position: Vector2 = position + (velocity * delta)
	new_position.x  = clamp(new_position.x, bounds.get("left"), bounds.get("right"))
	new_position.y  = clamp(new_position.y, bounds.get("lower"), bounds.get("upper"))

	position = new_position

func get_direction() -> Vector2:
	var direction:Vector2 = Vector2.ZERO

	if Input.is_action_pressed("move_down"):
		direction.y += 1
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	
	return direction.normalized()
	

func _on_action_area_bounds_changed(new_bounds: Dictionary) -> void:
	bounds = new_bounds
	print_debug("FROM PLAYER")
	print_rich(bounds)
