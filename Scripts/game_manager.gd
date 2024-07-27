extends Node

@onready var runes : Dictionary = {
	"air" : 0,
	"earth" : 0,
 	"fire" :  0,
	"water" :  0
}

func _ready():
	print(get_runes())
	print(get_rune("air"))
	add_rune("fire")
	add_rune("fire", 2)
	print(get_rune("fire"))
	subtract_rune("fire", 3)
	print(get_rune("fire"))
	subtract_rune("fire", 1)
	subtract_rune("fire")

func get_runes() -> Dictionary:
	return runes
	
func get_rune(rune_name:String) -> int:
	return runes[rune_name]

func add_rune(rune_name:String, amount : int = 1):
	runes[rune_name] += amount

func subtract_rune(rune_name:String, amount : int = 1):
	if runes[rune_name] - amount >= 0:
		runes[rune_name] -= amount
	else:
		print_debug("YOU SUBTRACTED MORE RUNES THAN YOU HAVE, YOU FILTHY FUCK!")
	

