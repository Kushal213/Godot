extends Area2D


var dragging = false
var tap_radius = 60  # Size of the sprite

func _input(event):
	if event is InputEventScreenTouch:
		print("Dragged")
		if (event.position - $Sprite.position).length() < tap_radius:
			# Start dragging if the click is on the sprite.
			if !dragging and event.pressed:
				dragging = true
		# Stop dragging if the button is released.
		if dragging and !event.pressed:
			dragging = false
		print(event.position)

	if event is InputEventScreenDrag and dragging:
		$Sprite.position = event.position
