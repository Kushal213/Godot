extends Node2D

onready var tank = $RigidBody2D
onready var muzzle = $RigidBody2D/Muzzle
onready var line = $Line2D
var max_points = 250

func update_trajectory(delta):
	line.clear_points()
	var pos = muzzle.global_position
	var vel = muzzle.global_transform.x * tank.muzzle_velocity
	for i in max_points:
		line.add_point(pos)
		vel.y += tank.gravity * delta
		pos += vel * delta
#		if pos.y > $Ground.position.y - 25:
#			break

func _process(delta):
	if Input.is_action_pressed("ui_up"):
		line.show()
		update_trajectory(delta)

#func _on_Bullet_exploded(pos):
#	tank.can_shoot = true
#	line.hide()
