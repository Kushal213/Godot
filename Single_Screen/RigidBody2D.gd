extends RigidBody2D

var dir 
var dragging 
var drag_start = Vector2()


func _unhandled_input(event):
	if event.is_action_pressed("ui_left") and not dragging:
		dragging = true
		drag_start = get_global_mouse_position()
	if event.is_action_released("ui_left") and dragging:
		dragging = false
		var drag_end = get_global_mouse_position()
		dir = drag_start - drag_end
		apply_impulse(Vector2(), dir*1.5)
#		print(dir)

func _physics_process(delta):
	set_process_unhandled_input(true)
#	print(dir)
	pass
