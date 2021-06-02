extends KinematicBody2D

var velocity = Vector2.ZERO
var dir = Vector2.ZERO


func _ready():
	$SwipeDetector.connect("swiped",self,"_on_SwipeDetector_swiped")
	$SwipeDetector.connect("swiped_cancelled",self,
	"_on_SwipeDetector_swiped_cancelled")

func _process(delta):
##	print("dir =", dir)
	move_and_slide(velocity * dir * delta)
	yield(get_tree().create_timer(0.2),"timeout")

func dash():
	velocity = Vector2(15000,15000)
	$Timer.start()

func _on_SwipeDetector_swiped(direction):
	dir = direction
#	print("direction",direction)
#	print("Swipped")
	dash()
#	var c = move_and_slide(velocity*direction)
#	print(c)

func _on_SwipeDetector_swiped_cancelled(start_position):
#	print("Swipped-cancelled")
#	print("start_position",start_position)
	pass


func _on_Timer_timeout():
	velocity = Vector2.ZERO
