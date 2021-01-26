extends KinematicBody

var gravity = Vector3.DOWN * 12
var speed =4
var jump_speed = 6

var velocity = Vector3()

func _physics_process(delta):
	velocity += gravity * delta
	velocity = move_and_slide(velocity, Vector3.UP)
		

