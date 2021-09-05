extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Hellow World!")

func _input(event):
	if event is InputEventMouseButton and event.is_pressed():
		EventManager.send(GameEvents.mouse_pressed, event.position)

func on_PogChamp(_args) -> void:
	print("PogChamp")
