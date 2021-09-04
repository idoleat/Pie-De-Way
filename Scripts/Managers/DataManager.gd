extends Node

var all_items = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	
	load_all_items()

func load_all_items():
	var path = "res://Resources/Items/"
	
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()
	
	var file_name = dir.get_next()
	while file_name != "":
		if !dir.current_is_dir():
			var item = load(path + file_name)
			all_items[item.name] = item
				
		file_name = dir.get_next()

func get_item_data(item_name : String):
	if not all_items.has(item_name):
		print("Can't find Item resource:" + item_name)
	else:
		return all_items[item_name]
