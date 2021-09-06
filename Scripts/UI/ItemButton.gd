extends Button

onready var Inv = get_node("../../..")

func _on_Button_button_down():
	Inv.use_item(self.text, 1)
	print("Use 1 ", self.text)
