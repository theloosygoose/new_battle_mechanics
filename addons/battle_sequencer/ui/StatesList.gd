extends ItemList

func _init() -> void:
	update_items()

func _ready() -> void:
	auto_height = true
	allow_search = true
	update_items()

func _enter_tree() -> void:
	update_items()

func update_items() -> void:
	if item_count < 2:
		for condition:String in Sequence.Conditions.keys():
			self.add_item(str(condition), null, true)

func _draw() -> void:
	update_items()
