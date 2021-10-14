extends KinematicBody2D

var _velocity := Vector2(-100,0)


func _physics_process(_delta):
	var _ignored := move_and_slide(_velocity)
	if get_slide_count() > 0:
		_velocity *= Vector2(-1,0)
