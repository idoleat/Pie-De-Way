extends Node

var items = {}
var money = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	EventManager.listen(GameEvents.get_item, funcref(self, "get_item"))
	EventManager.listen(GameEvents.get_money, funcref(self, "get_money"))

func get_item(args):
	var item_name = args.item_name
	var amount = args.amount
	
	if items.has(item_name):
		items[item_name] += amount
	else:
		items[item_name] = amount
	
	EventManager.send(GameEvents.update_item_amount, {item_name = item_name, amount = items[item_name]})
	print("Get item:" + item_name + ", current amount:" + str(items[item_name]))

func get_money(amount : int):
	money += amount
	EventManager.send(GameEvents.update_money_amount, {amount = money})

func spend_item(item_name, amount) -> bool:
	if amount > items[item_name]:
		return false
	else:
		items[item_name] -= amount
		EventManager.send(GameEvents.update_item_amount, {item_name = item_name, amount = items[item_name]})
		return true

func spend_money(amount : int):
	if amount > money:
		return false
	else:
		money -= amount
		return true
