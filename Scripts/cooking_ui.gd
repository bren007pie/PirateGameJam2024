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

func update_puzzle(new_puzzle : Node):
	puzzle = new_puzzle

func _on_cook_button_pressed():
	runes["air"] = air_button.button_pressed
	runes["earth"] = earth_button.button_pressed
	runes["fire"] = fire_button.button_pressed
	runes["water"] = water_button.button_pressed
	if GameManager.check_rune_availability(runes):
		result = puzzle.evaluate_solution(runes)
	else:
		result = false
	check_result()

func check_result():
	if result:
		
		clear()
		GameManager.close_cooking_menu()
		
	else:
		GameManager.wrong_answer()




func _on_exit_button_pressed():
	clear()
	GameManager.close_cooking_menu()

func clear():
	
		runes = {
				"air" : false,
				"earth" : false,
			 	"fire" :  false,
				"water" :  false }
		
		
		air_button.button_pressed = runes["air"]
		earth_button.button_pressed = runes["earth"]
		fire_button.button_pressed = runes["fire"]
		water_button.button_pressed = runes["water"]

func on_reveal():
	air_button.grab_focus()
