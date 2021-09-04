extends Node

var listeners = {}

func _ready():
	pass

func listen(event, callback):
	if not listeners.has(event):
		listeners[event] = []
		
	listeners[event].append(callback)

func cancel(event, callback):
	if listeners.has(event):
		if listeners[event].find(callback):
			listeners[event].remove(callback)

func send(event, args = null):
	if listeners.has(event):
		for callback in listeners[event]:
			callback.call_func(args)
