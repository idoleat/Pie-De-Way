extends Node

onready var inventory = $Inventory
onready var hint = $Hint
onready var ending = $Ending

var update_inventory_ref = funcref(self, "update_inventory")
var show_item_get_hint_ref = funcref(self, "show_item_get_hint")
var show_ending_ref = funcref(self, "show_ending")

# Called when the node enters the scene tree for the first time.
func _ready():
	EventManager.listen(GameEvents.update_item_amount, update_inventory_ref)
	EventManager.listen(GameEvents.get_item, show_item_get_hint_ref)
	EventManager.listen(GameEvents.show_ending, show_ending_ref)
	
	pass # Replace with function body.

func update_inventory(args):
	var item_name = args.item_name
	var amount = args.amount

	inventory.update_item(item_name, amount == 0)

func show_item_get_hint(args):
	var item_name = args.item_name
	var amount = args.amount
	
	hint.show_item_get(item_name, amount)

func show_ending(args):
	ending.change_ending_texts(args.title, args.comment)
	inventory.visible = false
	hint.visible = false
	ending.visible = true
	
	EventManager.cancel(GameEvents.update_item_amount, update_inventory_ref)
	EventManager.cancel(GameEvents.get_item, show_item_get_hint_ref)
	EventManager.cancel(GameEvents.show_ending, show_ending_ref)
