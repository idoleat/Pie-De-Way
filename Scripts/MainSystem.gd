extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Hellow World!")
	
	# EventManager.listen(GameEvents.mouse_pressed, funcref(self, "on_PogChamp"))
	TimeManager.start_countdown("test", 3, funcref(self, "on_PogChamp"))

	pass

func _input(event):
	if event is InputEventMouseButton and event.is_pressed():
		EventManager.send(GameEvents.mouse_pressed, event.position)
		# EventManager.send(GameEvents.get_item, "Apple")
		# print("mouse button event at ", event.position)

func on_PogChamp(_args) -> void:
	print("PogChamp")
