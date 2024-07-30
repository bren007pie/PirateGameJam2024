extends StaticBody2D
var puzzle_on : bool = true
@export_category("puzzle_solution")
@export var air_needed : bool
@export var earth_needed : bool
@export var fire_needed : bool
@export var water_needed : bool
@export_category("puzzle_reward")
@export var air_given : bool
@export var earth_given : bool
@export var fire_given : bool
@export var water_given : bool
@export var quicksilver_given : bool


# Called when the node enters the scene tree for the first time.
func _ready():
	Shabah.interactable_entered.connect(_on_interactable_entered)
	Shabah.interactable_exited.connect(_on_interactable_exited)
	Shabah.interactable_interacted.connect(_on_interactable_interacted)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# For when Shabah is looking at the puzzle
func _on_interactable_entered(interactable):
	# Gaurd to make sure it's only when Shabah is interacting with itself
	if interactable == self: 
		pass

# For when Shabah stops looking at the puzzle
func _on_interactable_exited(interactable):
	if interactable == self:
		pass

func _on_interactable_interacted(interactable):
	if interactable == self and puzzle_on:
		pass
		GameManager.add_rune("fire")
		puzzle_on = false
		$Sprite2D.modulate = Color.GREEN
