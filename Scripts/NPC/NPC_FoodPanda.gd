extends KinematicBody2D

export (int) var speed = 100

var target_position = position
var last_collider_id

func _ready():
	EventManager.listen(GameEvents.mouse_pressed, funcref(self, "get_input"))

func get_input(input_position : Vector2):
	target_position = get_node("../Player").position

func _physics_process(delta):
	var new_velocity = calculate_new_velocity(delta)
	move_and_slide(new_velocity)
	if (get_slide_count()):
		for i in get_slide_count(): 
			var collision = get_slide_collision(i)
			if(last_collider_id == collision.collider_id): continue
			if (collision.collider.has_method("Collided")):
				collision.collider.Collided()
			print("I collided with ", collision.collider.name)
			target_position = get_node("../B").position
			last_collider_id = collision.collider_id
	else:
		last_collider_id = 0

func calculate_new_velocity(delta) -> Vector2:
	var delta_position : Vector2 = target_position - position
	var direction = delta_position.normalized()
	var distance = delta_position.length()
	
	var veloctiy = Vector2(0, 0)
	if (distance > 0.001):
		veloctiy = delta_position * speed * delta
	
	return veloctiy
