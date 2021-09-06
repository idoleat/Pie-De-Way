extends Node
class_name InventoryUI

var itemlist_size = 7
var button_list = []
var item_id_dict = {}

onready var itemlist = get_node("ItemList")

func _ready():
	get_all_button_references()

func get_all_button_references():
	for i in itemlist_size:
		var button = get_node("ItemList/Item" + str(i))
		button_list.append(button)
		button.disabled = true

func update_item(item_name : String, remove : bool):
	if item_id_dict.has(item_name):
		if remove:
			var id = item_id_dict[item_name]
			item_id_dict.erase(item_name)
			
			button_list[id].disabled = true
			button_list[id].set_button_icon(null)
		return
	
	var data = DataManager.get_item_data(item_name)
	if data == null:
		print("Can't get correct item data:" + item_name)
		return
	
	if !item_id_dict.has(item_name):
		for i in itemlist_size:
			if not i in item_id_dict.values():
				button_list[i].name = item_name
				button_list[i].disabled = false
				button_list[i].set_button_icon(data.icon)
				
				item_id_dict[item_name] = i
				break

func use_item(item_name: String, amount: int):
	# Update data
	ItemManager.spend_item(item_name, amount)
