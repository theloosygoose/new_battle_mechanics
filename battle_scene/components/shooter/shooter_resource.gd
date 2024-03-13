extends Resource
class_name ShooterResource


enum Pattern {
    STRAIGHT,
    CONE,
}

@export var cooldown_time: float 
@export var pattern: Pattern