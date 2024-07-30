extends Node
signal runes_changed
var is_cooking : bool = false

@onready var canvas_layer = $CanvasLayer
@onready var ui = $UI
@onready var cooking_ui = $CookingUI

@onready var runes : Dictionary = {
	"air" : 0,
	"earth" : 0,
 	"fire" :  0,
	"water" :  0,
	"quicksilver" : 0
}

func _ready():
	ui.startup()
	

func get_runes() -> Dictionary:
	return runes

func get_rune(rune_name:String) -> int:
	return runes[rune_name]

func add_rune(rune_name:String, amount : int = 1):
	runes[rune_name] += amount
	runes_changed.emit()
	
func add_runes(runes_adding : Dictionary):
	for key in runes:
		if runes_adding.has(key): # gaurd for weird dictionaries
			runes[key] += int(runes_adding[key])
	runes_changed.emit()

func subtract_rune(rune_name:String, amount : int = 1):
	if runes[rune_name] - amount >= 0:
		runes[rune_name] -= amount
		runes_changed.emit()
	else:
		print_debug("YOU SUBTRACTED MORE RUNES THAN YOU HAVE, YOU FILTHY FUCK!")

func subtract_runes(runes_subtracting : Dictionary):
	for key in runes:
		if runes_subtracting.has(key): # gaurd for weird dictionaries
			if runes[key] - int(runes_subtracting[key]) >= 0:
				runes[key] -= int(runes_subtracting[key])
			else:
				print_debug("YOU SUBTRACTED MORE RUNES THAN YOU HAVE, YOU FILTHY FUCKS!")
	runes_changed.emit()

func open_cooking_menu_for_puzzle(puzzle : Node):
	cooking_ui.update_puzzle(puzzle)
	is_cooking = true
	get_tree().paused = true
	canvas_layer.visible = true
	ui.visible = false
	cooking_ui.visible = true
	cooking_ui.on_reveal()
	
func close_cooking_menu():
	is_cooking = false
	get_tree().paused = false
	canvas_layer.visible = false
	ui.visible = true
	cooking_ui.visible = false
	
func wrong_answer():
	
	
	print("cook button pressed!")
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_BOUNCE).set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tween.tween_property($CanvasLayer/ColorRect, "modulate", Color.RED, 0.1)
	tween.tween_property($CanvasLayer/ColorRect, "modulate", Color.RED, 1)
	tween.tween_property($CanvasLayer/ColorRect, "modulate", Color.from_string("2d2d2db4", Color.BLUE), 1)

func check_rune_availability(runes_checking : Dictionary) -> bool:
	var result = true
	for key in runes_checking:
		if runes.has(key) and runes[key] - int(runes_checking[key]) < 0:
			result = false
	return result
