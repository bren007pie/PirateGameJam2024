extends Node
signal runes_changed

@onready var runes : Dictionary = {
	"air" : 0,
	"earth" : 0,
 	"fire" :  0,
	"water" :  0,
	"quicksilver" : 0
}

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
