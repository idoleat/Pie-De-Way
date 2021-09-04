extends KinematicBody2D

export (int) var speed = 200

var target_position = position

func _ready():
	EventManager.listen(GameEvents.mouse_pressed, funcref(self, "get_input"))

func get_input(input_position : Vector2):
	target_position = input_position

func _physics_process(delta):
	var new_velocity = calculate_new_velocity(delta)
	move_and_slide(new_velocity)

func calculate_new_velocity(delta) -> Vector2:
	var delta_position : Vector2 = target_position - position
	var direction = delta_position.normalized()
	var distance = delta_position.length()
	
	var veloctiy = Vector2(0, 0)
	if (distance > 0.001):
		veloctiy = delta_position * speed * delta
	
	return veloctiy
