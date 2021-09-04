extends Node

var callbacks = {}
var timers = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func start_countdown(event : String, second : float, callback):
	var timer = Timer.new()
	
	timer.one_shot = true
	timer.wait_time = second
	timer.connect("timeout", self, "on_timer_timeout", [event])

	callbacks[event] = callback
	timers[event] = timer
	
	add_child(timer)
	timer.start()

func on_timer_timeout(event : String):
	callbacks[event].call_func(null)
	
	callbacks.erase(event)
	timers.erase(event)
	
	print("Countdown Event was ended:" + event)
