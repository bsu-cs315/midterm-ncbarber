extends KinematicBody2D

signal player_hit

var _velocity := Vector2(-100,0)
var isFlipped := false


func _physics_process(_delta):
	var _ignored := move_and_slide(_velocity)
	if get_slide_count() > 0:
		_velocity *= Vector2(-1,0)
	for i in get_slide_count():
		var collision := get_slide_collision(i)
		if collision.collider.name == "Player":
			print("Hit!")
			emit_signal("player_hit")
		if _velocity.x > 0:
			$AnimatedSprite.flip_h = true
			isFlipped = true
		elif _velocity.x < 0:
			$AnimatedSprite.flip_h = false
			isFlipped = false
