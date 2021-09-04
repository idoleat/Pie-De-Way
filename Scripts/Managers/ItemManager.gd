extends Node

var items = {}
var money = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	
	EventManager.listen(GameEvents.get_item, funcref(self, "get_item"))
	EventManager.listen(GameEvents.get_money, funcref(self, "get_money"))

func get_item(item_name : String):
	if items.has(item_name):
		items[item_name] += 1
	else:
		items[item_name] = 1
	
	EventManager.send(GameEvents.update_item_amount, {name = item_name, amount = items[item_name]})
	print("Get item:" + item_name + ", current amount:" + str(items[item_name]))

func get_money(amount : int):
	money += amount
	EventManager.send(GameEvents.update_money_amount, {amount = money})
