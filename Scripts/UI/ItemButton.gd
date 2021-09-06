extends Button

onready var inventory = get_node("../..")

func _ready():
	connect("pressed", self, "_on_button_pressed")

func _on_button_pressed():
	inventory.use_item(name, 1)
	if(name == "X7RE4P"): 
		print("Food deliver~~~")
		var who_deliver = randi() % 2
		if (who_deliver == 1):
			get_node("/root/Main/UberEats").Deliver()
		else: 
			get_node("/root/Main/FoosPanda").Deliver()
