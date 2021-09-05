extends Node

onready var holder = $Holder
onready var icon_texture = $Holder/ItemIcon
onready var amount_label = $Holder/ItemAmount as Label

onready var tween = $Tween as Tween
var holder_position

func _ready():
	icon_texture.modulate.a = 0
	amount_label.modulate.a = 0
	holder_position = holder.get_rect().position.y

func show_item_get(item_name, amount):
	var data = DataManager.get_item_data(item_name)
	if data == null:
		print("Can't get correct item data:" + item_name)
		return
	
	icon_texture.get_stylebox("panel").set_texture(data.icon)
	amount_label.text = (" x " + str(amount))
	
	if tween.is_active():
		tween.remove_all()
	
	tween.interpolate_property(holder, "rect_position:y", holder_position, holder_position - 40, 0.5, Tween.TRANS_CUBIC, Tween.EASE_OUT)
	tween.interpolate_property(icon_texture, "modulate:a", 0, 1, 0.5, Tween.TRANS_CUBIC, Tween.EASE_OUT)
	tween.interpolate_property(amount_label, "modulate:a", 0, 1, 0.5, Tween.TRANS_CUBIC, Tween.EASE_OUT)
	tween.start()
	
	yield(tween, "tween_completed")
	
	tween.interpolate_property(holder, "rect_position:y", holder_position - 40, holder_position - 100, 0.1, Tween.TRANS_CUBIC, Tween.EASE_IN)
	tween.interpolate_property(icon_texture, "modulate:a", 1, 0, 0.1, Tween.TRANS_CUBIC, Tween.EASE_IN)
	tween.interpolate_property(amount_label, "modulate:a", 1, 0, 0.1, Tween.TRANS_CUBIC, Tween.EASE_IN)
	tween.start()
