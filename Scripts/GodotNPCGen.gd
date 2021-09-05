extends Node

export (float) var Spacing = 80
export (float) var MaxJitterAmount = 0.0

var heads = []
var character
var gen_point
var Amount = 0

func _ready():
	for file in list_files_in_directory("res://Resources/NPCheads/"):
		heads.append(load("res://Resources/NPCheads/" + file))
	character = load("res://Scenes/BaseCharacter.tscn")
	gen_point = get_node("GenPoint").position

func list_files_in_directory(path):
	var files = []
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()

	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			files.append(file)

	dir.list_dir_end()

	return files

func _on_Button_button_down():
	generate(Amount)
	
func generate(amount: int):
	if (amount < 0): return
	for i in range(0, amount):
		var ch =  character.instance()
		var ch_head = ch.get_node("Head")
		var rand  = randi() % heads.size()
		ch_head.texture = heads[rand].head
		ch_head.position = heads[rand].offset
		ch_head.scale = heads[rand].scale
		ch.name = heads[rand].name
		ch.position = Vector2(
			gen_point.x + i * Spacing + randf() * MaxJitterAmount - MaxJitterAmount/2,
			gen_point.y + randf() * MaxJitterAmount - MaxJitterAmount/2)
		add_child(ch)

func _on_LineEdit_text_changed(new_text):
	Amount = new_text.to_int()
