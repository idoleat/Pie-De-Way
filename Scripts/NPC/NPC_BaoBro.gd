extends KinematicBody2D

export(VideoStream) var bao_video
var video_player : VideoPlayer

var video_is_playing = false
var watch_time = 0

onready var gui = get_node("../GUI")

func _ready():
	pass # Replace with function body.

func Collided():
	print("RRRRRRRRRRRR")
	EventManager.send(GameEvents.get_item, {item_name = "CurryRice", amount = 1})
	
	if video_is_playing:
		return
	
	video_player = VideoPlayer.new()
	gui.add_child(video_player)
	gui.move_child(video_player, 0)
	video_player.stream = bao_video
	video_player.volume = 0.15
	video_player.rect_position.x = 0
	video_player.rect_position.y = 0
	video_player.rect_size.x = 350
	video_player.rect_size.y = 600
	video_player.connect("finished", self, "on_video_finished")
	
	video_is_playing = true
	video_player.play()

func on_video_finished():
	video_player.queue_free()
	
	video_is_playing = false
	watch_time += 1
	
	EventManager.send(GameEvents.curry_video_finished, {times = watch_time})
