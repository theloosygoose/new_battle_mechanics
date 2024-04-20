extends EnemyState 

var shooters: Array[ShooterComponent]
var timer: Timer 

func start() -> void:
	for child: Node in child_nodes:
		if child is ShooterComponent:
			var shooter: ShooterComponent = child
			shooters.append(shooter)

		if child is Timer:
			timer = child
			timer.timeout.connect(_on_timer_timeout)
	
	timer.start()

func run(_delta: float) -> void: 
	for shooter in shooters:
		shooter.pull_trigger()

func physics_run(_delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	print(self.data.state_name, " ENDED")
	switch.emit(self, "02_state")
