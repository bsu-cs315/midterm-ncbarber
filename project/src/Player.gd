extends KinematicBody2D

var velocity := Vector2()
var gravity := 600
var jumpPower := -420
var speed := 300
var jumpped := false
var isFlipped := false


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
	
	_process_animation()
	#_process_collision()
	velocity.y += gravity * delta
	
	if jumpped and is_on_floor():
		jumpped = false
	
	velocity = move_and_slide(velocity, Vector2(0,-1))


func _process_animation():
	if Input.is_action_pressed("right") and is_on_floor():
		$AnimatedSprite.animation = "walking"
		$AnimatedSprite.play()
		$AnimatedSprite.flip_h = false
		isFlipped = false
		
	if Input.is_action_pressed("left") and is_on_floor():
		$AnimatedSprite.animation = "walking"
		$AnimatedSprite.play()
		$AnimatedSprite.flip_h = true
		isFlipped = true

	if velocity.x == 0 and is_on_floor():
		$AnimatedSprite.animation = "idle"
		$AnimatedSprite.play()
