extends KinematicBody2D


var gravity = 9.8

var velocity = Vector2.ZERO


func _physics_process(delta):
	velocity.y += gravity
	
	move_and_slide(velocity, Vector2.UP)
