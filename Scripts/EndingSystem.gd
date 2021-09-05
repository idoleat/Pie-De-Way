extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	TimeManager.start_countdown("FirstEnding", 2 * 60 * 60, funcref(self, "first_ending"))
	EventManager.listen(GameEvents.update_item_amount, funcref(self, "second_ending"))
	
func first_ending(args):
	EventManager.send(GameEvents.show_ending, {title = "O WOW", comment = "好玩嗎？"})
	announce_endgame()

func second_ending(args):
	if args.amount > 30:
		EventManager.send(GameEvents.show_ending, {title = "傘店～", comment = "快避開！"})
		announce_endgame()

func announce_endgame():
	EventManager.send(GameEvents.game_ended)
