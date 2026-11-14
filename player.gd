extends CharacterBody2D





const SPEED = 500.0
const JUMP_VELOCITY = -900.0

func respawn():
	self.global_position = Vector2(140,-479.375)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		$AnimatedSprite2D.frame=0
	else:
		$AnimatedSprite2D.frame=1
	
	if velocity.x >0:
		$AnimatedSprite2D.flip_h = true
	elif velocity.x<0:
		$AnimatedSprite2D.flip_h = false
	

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()




	
