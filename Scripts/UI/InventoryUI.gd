extends Node
class_name InventoryUI

var panel_count = 7
var panel_list = []
var item_id_dict = {}

onready var itemlist = get_node("ItemList")

func _ready():
	get_all_panel_references()

func get_all_panel_references():
	for i in panel_count:
		panel_list.append(get_node("ItemList/Panel" + str(i)))

func show_item(item_name : String):
	if item_id_dict.has(item_name):
		return
	
	var data = DataManager.get_item_data(item_name)
	if data == null:
		print("Can't get correct item data:" + item_name)
		return
	
	if !item_id_dict.has(item_name):
		for i in panel_count:
			if not i in item_id_dict.values():
				panel_list[i].get_stylebox("panel").set_texture(data.icon)
				item_id_dict[item_name] = i
				break
