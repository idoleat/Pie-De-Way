extends Node

onready var inventory = get_node("Inventory")
onready var ending = get_node("Ending")

# Called when the node enters the scene tree for the first time.
func _ready():
	EventManager.listen(GameEvents.update_item_amount, funcref(self, "update_inventory"))
	
	TimeManager.start_countdown("FirstEnding", 2 * 60 * 60, funcref(self, "first_ending"))
	
	pass # Replace with function body.

func update_inventory(args):
	var item_name = args.item_name
	var amount = args.amount

	inventory.show_item(item_name)

func start_ending():
	inventory.switch_visible(false)
	ending.switch_visible(true)
	
#for testing
func first_ending(args):
	ending.change_ending_texts("O WOW", "好玩嗎？")
	start_ending()
