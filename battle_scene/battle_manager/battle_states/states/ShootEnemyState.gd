extends EnemyState 
class_name ShootEnemyState

var shooters: Array[ShooterComponent]
var timer: Timer

var call_count: int = 0

func start() -> void:
	if call_count == 0:
		for child: Node in child_nodes:
			if child.get_class() == "ShooterComponent":
				var shooter: ShooterComponent = child
				shooters.append(shooter)

			if child.get_class() == "Timer":
				timer = child
				timer.timeout.connect(_on_timer_timeout)

	timer.start()

	call_count += 1

func run(_delta: float) -> void: 
	for shooter in shooters:
		shooter.pull_trigger()
	

func physics_run(_delta: float) -> void:
	pass

func end() -> void:
	queue_free()

func _on_timer_timeout() -> void:
	switch.emit(self, data.switch_state)
