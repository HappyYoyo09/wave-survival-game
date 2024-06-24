extends CharacterBody2D


@export var SPEED = 300.0
@export var health = 3
@onready var immunity_time = $"immunity time"
@onready var hurtbox = $hurtbox



func _physics_process(delta):
	var direction_x = Input.get_axis("move_left", "move_right")
	if direction_x:
		velocity.x = direction_x * SPEED
	else:
		velocity.x = 0
		
	var direction_y = Input.get_axis("move_up", "move_down")
	if direction_y:
		velocity.y = direction_y * SPEED
	else:
		velocity.y = 0
	
	Autoload.player_pos.emit(position)
	
	move_and_slide()


func _on_hurtbox_body_entered(body):
	health -= 1
	print(health)
	immunity_time.start()
	set_deferred("monitoring", false) #stops the hurtbox from detecting collisions
	


func _on_immunity_time_timeout():
	set_deferred("monitoring", true)
