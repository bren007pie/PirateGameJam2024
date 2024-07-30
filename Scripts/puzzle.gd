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
var runes_needed : Dictionary 
var runes_rewarded : Dictionary 

# Called when the node enters the scene tree for the first time.
func _ready():
	Shabah.interactable_entered.connect(_on_interactable_entered)
	Shabah.interactable_exited.connect(_on_interactable_exited)
	Shabah.interactable_interacted.connect(_on_interactable_interacted)
	runes_needed = {"air" : air_needed,
				"earth" : earth_needed,
			 	"fire" :  fire_needed,
				"water" :  water_needed}
	runes_rewarded = {"air" : air_given,
				"earth" : earth_given,
			 	"fire" :  fire_given,
				"water" :  water_given,
				"quicksilver" : quicksilver_given}


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

# Press puzzle/interact button
func _on_interactable_interacted(interactable):
	if interactable == self and puzzle_on:
		GameManager.open_cooking_menu_for_puzzle(self)

# runes is a dictionary of bools, bool is the result
func evaluate_solution(runes : Dictionary) -> bool:
	if runes == runes_needed:
		GameManager.close_cooking_menu()
		GameManager.subtract_runes(runes_needed)
		GameManager.add_runes(runes_rewarded)
		puzzle_on = false # flag to turn off puzzle
		return true # signaling for the function
	else:
		return false
	 

