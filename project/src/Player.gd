extends KinematicBody2D

var velocity := Vector2()
var gravity := 600
var jumpPower := -350
var speed := 300
var jumpped := false


func _physics_process(delta):
	velocity.x = 0
	# Checking for when certian Controls are pressed
	if Input.is_action_pressed("right"):
		velocity.x += speed

	if Input.is_action_pressed("left"):
		velocity.x -= speed

	if Input.is_action_pressed("jump"):
		if is_on_floor():
			velocity.y = jumpPower
			jumpped = true

	velocity.y += gravity * delta
	
	if jumpped and is_on_floor():
		jumpped = false
	
	velocity = move_and_slide(velocity, Vector2(0,-1))
