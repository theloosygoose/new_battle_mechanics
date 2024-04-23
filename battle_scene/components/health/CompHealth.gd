extends Node
class_name CompHealth

@export var data: HealthResource
@onready var health: float = data.max_health

signal health_depleated
signal health_changed(new_health:int) 

func _ready() -> void:
	health_changed.emit(health)
	self.health_depleated.connect(_on_health_depleated)

func damage(attack: Attack) -> void:
	print("took DAMAGE", attack.damage)
	health -= attack.damage 

	if health >= 0.0:
		health_depleated.emit()

	health_changed.emit(health)


func _on_health_depleated() -> void:
	get_parent().queue_free()
