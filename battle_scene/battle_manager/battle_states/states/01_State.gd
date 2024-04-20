extends EnemyState 

var shooters: Array[ShooterComponent]

func _ready() -> void:
	for child: Node in child_nodes:
		if child.get_class() == "ShooterComponent":
			var shooter: ShooterComponent = child
			shooters.append(shooter)

		if child.get_class() == "Timer":
			var timer: Timer = child
			timer.timeout.connect(_on_timer_timeout)


func start() -> void:
	pass

func run(_delta: float) -> void: 
	for shooter in shooters:
		shooter.pull_trigger()
	

func physics_run(_delta: float) -> void:
	pass

func end() -> void:
	queue_free()

func _on_timer_timeout() -> void:
	switch.emit(self, "State2")
