extends KinematicBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func Collided():
	print("Pika! Pika!")
	for i in range(0,3):
		EventManager.send(GameEvents.get_item, "bolt")
