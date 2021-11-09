extends KinematicBody2D

export var speed = 50.0
export var gravity = 9.8
export var jump_speed = 500.0

var velocity = Vector2.ZERO


func _physics_process(delta):
	velocity.y += gravity
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	else:
		velocity.x = 0.0
	
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = -jump_speed
	
	velocity = move_and_slide(velocity, Vector2.UP)
