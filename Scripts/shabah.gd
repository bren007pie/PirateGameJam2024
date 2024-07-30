extends CharacterBody2D

const ACCL = 900.0
const MAX_SPEED = 300.0
@onready var ray_cast_2d = $RayCast2D
@onready var sprite_2d = $Sprite2D

var interactable_detected = false

var current_interactable

signal interactable_entered(interactable)
signal interactable_exited(interactable)
signal interactable_interacted(interactable)

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
	
	if velocity.length():
		sprite_2d.rotation = velocity.angle()
	
	ray_cast_2d.rotation = sprite_2d.rotation - deg_to_rad(90)
	
	move_and_slide()
	
	if ray_cast_2d.is_colliding() and not interactable_detected:
		interactable_detected = true
		current_interactable = ray_cast_2d.get_collider()
		interactable_entered.emit(current_interactable)
		print("detection emitted")
	elif not ray_cast_2d.is_colliding() and interactable_detected:
		interactable_detected = false
		interactable_exited.emit(current_interactable)
		current_interactable = null
		print("undetection emitted")

func _unhandled_input(event):
	if event.is_action_pressed("Interact"):
		GameManager.wrong_answer()
		if current_interactable:
			interactable_interacted.emit(current_interactable)
