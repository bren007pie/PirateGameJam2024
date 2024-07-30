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

func subtract_rune(rune_name:String, amount : int = 1):
	if runes[rune_name] - amount >= 0:
		runes[rune_name] -= amount
		runes_changed.emit()
	else:
		print_debug("YOU SUBTRACTED MORE RUNES THAN YOU HAVE, YOU FILTHY FUCK!")

func open_cooking_menu_for_puzzle(puzzle : Node):
	is_cooking = true
	get_tree().paused = true
	canvas_layer.visible = true
	ui.visible = false
	cooking_ui.visible = true
	
func close_cooking_menu():
	is_cooking = false
	get_tree().paused = false
	canvas_layer.visible = false
	ui.visible = true
	cooking_ui.visible = false
	
func wrong_answer():
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_BOUNCE)
	tween.tween_property($CanvasLayer/ColorRect, "modulate", Color.RED, 0.1)
	tween.tween_property($CanvasLayer/ColorRect, "modulate", Color.RED, 1)
	tween.tween_property($CanvasLayer/ColorRect, "modulate", Color.from_string("2d2d2db4", Color.BLUE), 1)
