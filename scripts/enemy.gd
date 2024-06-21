extends CharacterBody2D

@export var SPEED = 300.0
@export var accuracy = 10
func _physics_process(delta):
	var target = get_viewport().get_mouse_position()
	#position.x - target.x <= accuracy or position.y - target.y <= accuracy and position.x - target.x >= accuracy or position.y - target.y >= accuracy 
	var difference = Vector2(target.x - position.x, target.y - position.y)
	if difference.x <= 0:
		difference.x *= -1
	if difference.y <= 0:
		difference.y *= -1
	
	var distance_to_target = sqrt(difference.x ** 2 + difference.y ** 2)
	print(distance_to_target)
	if !distance_to_target <= accuracy:
		look_at(target)
		velocity = transform.x * SPEED
	else:
		velocity = Vector2.ZERO
	
	move_and_slide()
