extends Node2D

func _process(delta):
	
	$Camera2D.position = $Player.position
	$Camera2D.zoom = Vector2(3,3)
