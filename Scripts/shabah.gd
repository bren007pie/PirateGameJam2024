extends CharacterBody2D

const ACCL = 1200.0
const MAX_SPEED = 500.0
@onready var ray_cast_2d = $RayCast2D
@onready var sprite_2d = $Sprite2D

var interactable_detected = false

var current_interactable

signal interactable_entered(interactable)
signal interactable_exited(interactable)
signal interactable_interacted(interactable)

var facing_left = false
var direction

@onready var jiggle_tween = get_tree().create_tween().set_trans(Tween.TRANS_CUBIC).set_loops()

func _ready():
	jiggle_tween.bind_node(self)
	jiggle_tween.tween_property(sprite_2d, "rotation_degrees", 8, 0.2)
	jiggle_tween.tween_property(sprite_2d, "rotation_degrees", -8, 0.2)
	jiggle_tween.pause()

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	direction = Vector2(Input.get_axis("Left", "Right"), Input.get_axis("Up", "Down"))
	if direction.length_squared() == 0:
		velocity = Vector2.ZERO
	else:
		velocity += direction*ACCL*delta
		
	if velocity.length() > MAX_SPEED:
		velocity = velocity.normalized()*MAX_SPEED
	
	if velocity.length():
		jiggle_tween.play()
		update_sprite()
		jiggle_tween.set_speed_scale(velocity.length()/MAX_SPEED)
	else:
		jiggle_tween.pause()
	
	if direction.length_squared() > 0:
		ray_cast_2d.rotation = direction.angle() - deg_to_rad(90)
	
	move_and_slide()
	
	if ray_cast_2d.is_colliding() and not interactable_detected:
		interactable_detected = true
		current_interactable = ray_cast_2d.get_collider()
		# First detects interactable (first frame)
		interactable_entered.emit(current_interactable)
		print("detection emitted")
	elif not ray_cast_2d.is_colliding() and interactable_detected:
		interactable_detected = false
		# Exited interactable (first frame when gone)
		interactable_exited.emit(current_interactable)
		current_interactable = null
		print("undetection emitted")

func update_sprite():
	if direction.x < 0 and facing_left == false:
		facing_left = true
		var tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE)
		tween.tween_property(sprite_2d, "scale", Vector2(-1,1), .5)
	elif direction.x > 0 and facing_left == true:
		facing_left = false
		var tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE)
		tween.tween_property(sprite_2d, "scale", Vector2(1,1), .5)


func _unhandled_input(event):
	if event.is_action_pressed("Interact"):
		if current_interactable:
			# When interact button pressed
			interactable_interacted.emit(current_interactable)
