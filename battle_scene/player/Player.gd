extends CharacterBody2D
class_name Player


@export var action_area: ActionArea 
@export var character_resource: CharacterResource

@onready var speed: float = character_resource.speed

@onready var bounds_vectors: Dictionary = action_area.current_bounds_dict

func _ready() -> void:
	for child in get_children():
		if child is Sprite2D:
			var sprite2D: Sprite2D = child
			sprite2D.texture = character_resource.sprite

func _physics_process(delta: float) -> void:
	var direction: Vector2 = get_direction()
	velocity = direction * speed

	move_and_collide(velocity * delta)

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
	