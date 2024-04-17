extends Projectile


func _enter_tree() -> void:
	animate()

func animate() -> void:
	apply_scale(Vector2(0.5, 0.5))
