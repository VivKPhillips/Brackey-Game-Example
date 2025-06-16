extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

@onready var animated_sprite_idle: AnimatedSprite2D = $AnimatedSprite_idle
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# Getting the input direction: -1, 0, 1 = left, center/idle, right
	var direction := Input.get_axis("move_left", "move_right")
	
	#Flipping the sprite based on directions
	if direction > 0:
		animated_sprite_idle.flip_h = false
	elif direction < 0:
		animated_sprite_idle.flip_h = true
		
		#Player Character Animations
	if is_on_floor():
		if direction == 0:
			animated_sprite_idle.play("Idle")
		else:
				animated_sprite_idle.play("Run")
			
	else:
			animated_sprite_idle.play("Jump")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		

	move_and_slide()
