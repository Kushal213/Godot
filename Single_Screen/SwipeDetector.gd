extends Node2D

signal swiped(direction)
signal swiped_cancelled(start_position)
export(float, 1.0, 1.5) var MAX_DIAGONAL_SLOPE = 1.3

onready var timer = $Timer
var swipe_start_position = Vector2()

func _ready():
	pass

func _input(event):
	if not event is InputEventScreenTouch:
		return
	if event.pressed:
		_start_detection(event.position)
	elif not  timer.is_stopped():
		_end_detection(event.position)
	else:
		return

func _start_detection(position):
	swipe_start_position = position
#	print(3)
	timer.start()

func _end_detection(position):
	timer.stop()
#	print(2)
#	print(swipe_start_position)
	var direction = (position-swipe_start_position).normalized()
#	print(direction.x)
#	print(direction.y)
	if abs(direction.x) + abs(direction.y) >= MAX_DIAGONAL_SLOPE:
		return
	if abs(direction.x) > abs(direction.y):
		emit_signal("swiped",Vector2(sign(direction.x),0.0))
#		print(Vector2(sign(direction.x),0.0))
	else:
		emit_signal("swiped",Vector2(0.0,sign(direction.y)))
#		print(Vector2(0.0,sign(direction.y)))
		

func _on_Timer_timeout():
	emit_signal("swiped_cancelled",swipe_start_position)
