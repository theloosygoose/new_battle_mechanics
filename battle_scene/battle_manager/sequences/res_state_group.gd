class_name StateGroup extends Resource

@export var id: int 

@export_group("Condition")
@export var condition: Sequence.Conditions = Sequence.Conditions.TIMER
@export var cond_value: int = 0


@export_group("Groups")
@export var states: Array[String]
