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
@export_category("sprites")
@export var base : Texture2D
@export var solved : Texture2D
var runes_needed : Dictionary 
var runes_rewarded : Dictionary 
@onready var sprite_2d = $Sprite2D
var sprite_scale

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite_scale = sprite_2d.scale
	sprite_2d.texture = base
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
	if interactable == self and puzzle_on: 
		var tween = get_tree().create_tween().set_trans(Tween.TRANS_CUBIC).set_parallel()
		tween.tween_property(sprite_2d, "modulate", Color(1.5,1.5,1.5), .25)
		tween.tween_property(sprite_2d, "scale", sprite_scale*1.2, 0.25)

# For when Shabah stops looking at the puzzle
func _on_interactable_exited(interactable):
	if interactable == self:
		var tween = get_tree().create_tween().set_trans(Tween.TRANS_CUBIC).set_parallel()
		tween.tween_property(sprite_2d, "modulate", Color(1,1,1), .25)
		tween.tween_property(sprite_2d, "scale", sprite_scale, 0.25)

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
		sprite_2d.texture = solved
		puzzle_on = false # flag to turn off puzzle
		
		return true # signaling for the function
	else:
		return false
	 

