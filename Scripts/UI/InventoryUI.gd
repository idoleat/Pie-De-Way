extends Node
class_name InventoryUI

var panel_count = 7
var panel_list = []
var item_name_list = []

func _ready():
	get_all_panel_references()

func get_all_panel_references():
	for i in panel_count:
		panel_list.append(get_node("ItemList/Panel" + str(i)))

func show_item(item_name : String):
	if item_name_list.has(item_name):
		return
	
	var data = DataManager.get_item_data(item_name)
	panel_list[0].get_stylebox("panel").set_texture(data.icon)
