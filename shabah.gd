extends CharacterBody2D

const ACCL = 900.0
const MAX_SPEED = 300.0


func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	
	var direction = Vector2(Input.get_axis("Left", "Right"), Input.get_axis("Up", "Down"))
	if direction.length_squared() == 0:
		velocity = Vector2.ZERO
	else:
		velocity += direction*ACCL*delta
		
	if velocity.length() > MAX_SPEED:
		velocity = velocity.normalized()*MAX_SPEED

	move_and_slide()
