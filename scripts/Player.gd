extends KinematicBody2D

export var max_speed = 100.0
export var acceleration = 200.0
export var friction = 0.97
export var gravity = 9.8
export var jump_speed = 500.0

var velocity = Vector2.ZERO


func _physics_process(delta):
	velocity.y += gravity
	
	# Check input
	var input = 0.0
	
	if Input.is_action_pressed("ui_right"):
		input += 1.0
		
	if Input.is_action_pressed("ui_left"):
		input -= 1.0
	
	# Add acceleration
	velocity.x += input * acceleration * delta
	
	# Take away friction
	if input == 0.0:
		velocity.x  = velocity.x * friction
	
	# Apply a max speed.
	if abs(velocity.x) > max_speed:
		 velocity.x = max_speed * sign(velocity.x)
	
	# Check for jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = -jump_speed
	
	velocity = move_and_slide(velocity, Vector2.UP)
