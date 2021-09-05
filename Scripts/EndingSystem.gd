extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	TimeManager.start_countdown("FirstEnding", 2 * 60 * 60, funcref(self, "first_ending"))
	EventManager.listen(GameEvents.update_item_amount, funcref(self, "second_ending"))
	EventManager.listen(GameEvents.curry_video_finished, funcref(self, "third_ending"))
	
func first_ending(args):
	EventManager.send(GameEvents.show_ending, {title = "O WOW", comment = "好玩嗎？"})
	announce_endgame()

func second_ending(args):
	if args.amount > 30:
		EventManager.send(GameEvents.show_ending, {title = "傘店～", comment = "使用落雷"})
		announce_endgame()

func third_ending(args):
	if args.times >= 3:
		EventManager.send(GameEvents.show_ending, {title = "啊啊啊啊啊", comment = "那我們打開了 啊"})
		announce_endgame()

func announce_endgame():
	EventManager.send(GameEvents.game_ended)
