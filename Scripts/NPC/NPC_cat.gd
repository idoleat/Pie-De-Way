extends KinematicBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func Collided():
	print("Meow~~~~~")
	EventManager.send(GameEvents.get_item, "X7RE4P")
