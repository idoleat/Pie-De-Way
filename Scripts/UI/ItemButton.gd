extends Button

onready var inventory = get_node("../..")

func _ready():
	connect("pressed", self, "_on_button_pressed")

func _on_button_pressed():
	inventory.use_item(name, 1)
	print("Use 1 ", self.text)
