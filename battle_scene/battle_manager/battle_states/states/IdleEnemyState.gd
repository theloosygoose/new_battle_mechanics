extends EnemyState
class_name IdleEnemyState


@export var input_button: Button

func start() -> void:
	input_button.pressed.connect(_on_btn_click)

func _on_btn_click() -> void:
	switch.emit(self, data.switch_state)
