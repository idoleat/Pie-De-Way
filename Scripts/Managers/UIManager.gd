extends Node

onready var inventory = $Inventory
onready var hint = $Hint
onready var ending = $Ending

# Called when the node enters the scene tree for the first time.
func _ready():
	EventManager.listen(GameEvents.update_item_amount, funcref(self, "update_inventory"))
	EventManager.listen(GameEvents.get_item, funcref(self, "show_item_get_hint"))
	
	TimeManager.start_countdown("FirstEnding", 2 * 60 * 60, funcref(self, "first_ending"))
	
	pass # Replace with function body.

func update_inventory(args):
	var item_name = args.item_name
	var amount = args.amount

	inventory.show_item(item_name)

func show_item_get_hint(args):
	var item_name = args.item_name
	var amount = args.amount
	
	hint.show_item_get(item_name, amount)

func start_ending():
	inventory.switch_visible(false)
	ending.switch_visible(true)
	
#for testing
func first_ending(args):
	ending.change_ending_texts("O WOW", "好玩嗎？")
	start_ending()
