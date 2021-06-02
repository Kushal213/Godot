extends Area2D

var velocity = Vector2(350, 0)


func _process(delta):
	velocity.y += gravity * delta
	position += velocity * delta
	rotation = velocity.angle()


func _on_BallisticBullet_body_entered(body):
	queue_free()
