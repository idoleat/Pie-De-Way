extends Node

onready var inventory = get_node("Inventory")
var test = false

# Called when the node enters the scene tree for the first time.
func _ready():
	EventManager.listen(GameEvents.update_item_amount, funcref(self, "update_inventory"))
	
	pass # Replace with function body.

func update_inventory(args):
	var item_name = args.item_name
	var amount = args.amount

	inventory.show_item(item_name)
