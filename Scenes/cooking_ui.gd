extends CanvasLayer
var puzzle:Node = null
var result:bool = false

@onready var air_button = $"CookingUI/VBoxContainer/Air Button"
@onready var earth_button = $"CookingUI/VBoxContainer/Earth Button"
@onready var fire_button = $"CookingUI/VBoxContainer/Fire Button"
@onready var water_button = $"CookingUI/VBoxContainer/Water Button"

@onready var runes : Dictionary = {
	"air" : false,
	"earth" : false,
 	"fire" :  false,
	"water" :  false }

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_puzzle(new_puzzle : Node):
	puzzle = new_puzzle

func _on_cook_button_pressed():
	runes["air"] = air_button.pressed
	runes["earth"] = earth_button.pressed
	runes["fire"] = fire_button.pressed
	runes["water"] = water_button.pressed
	result = puzzle.evaluate_solution(runes)
	check_result()

func check_result():
	if result:
		
		runes = {
				"air" : false,
				"earth" : false,
			 	"fire" :  false,
				"water" :  false }
		
		
		air_button.pressed = runes["air"]
		earth_button.pressed = runes["earth"]
		fire_button.pressed = runes["fire"]
		water_button.pressed = runes["water"]
		
		GameManager.close_cooking_menu()
	else:
		GameManager.wrong_answer()


