extends Node2D


onready var body0 = $RigidBody2D
onready var position0 = $RigidBody2D/Position2D
onready var line = $Line2D
var max_points = 250

func update_trajectory(delta):
	var pos = position0.global_position
	for i in max_points:
		line.add_point(pos)

func _process(delta):
	if Input.is_action_pressed("ui_left"):
		update_trajectory(delta)

