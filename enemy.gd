extends CharacterBody2D

@export var SPEED = 300.0
@export var accuracy = Vector2(50, 50)
func _physics_process(delta):
	var target = get_viewport().get_mouse_position()
	
	if true:
		velocity = transform.x * SPEED
		look_at(get_viewport().get_mouse_position())
	else:
		velocity = Vector2.ZERO
	
	move_and_slide()
