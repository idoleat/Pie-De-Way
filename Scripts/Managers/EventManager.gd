extends Node

var listeners = {}

func _ready():
	pass

func listen(event, callback):
	if not listeners.has(event):
		listeners[event] = []
	
	print("Event:" + str(event) + " Callback:" + str(callback) + " is added")
	listeners[event].append(callback)

func cancel(event, callback):
	if listeners.has(event):
		if listeners[event].find(callback) != -1:
			print("Event:" + str(event) + " Callback:" + str(callback) + " is canceled")
			listeners[event].erase(callback)

func send(event, args = null):
	if listeners.has(event):
		for callback in listeners[event]:
			callback.call_func(args)
