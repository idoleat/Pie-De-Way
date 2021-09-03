extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Hellow World!")
	
	EventManager.listen(GameEvents.mouse_pressed, funcref(self, "on_PogChamp"))

	pass

func _process(delta):
	#print("Hellow World!")
	pass

func _input(event):
	if event is InputEventMouseButton and event.is_pressed():
		EventManager.send(GameEvents.mouse_pressed)
		print("mouse button event at ", event.position)
		

func on_PogChamp(args) -> void:
	print("PogChamp")
