extends Camera2D

func _process(delta):
	self.position = get_tree().get_node('Player').position()


#func _process(delta): #It works
#	$Camera2D.position += Vector2(0,-2)





 
