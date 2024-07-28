extends CanvasLayer
@onready var quicksilver_texture = $"VBoxContainer/QuickSilver Container/QuickSilver Texture"
@onready var quicksilver_text = $"VBoxContainer/QuickSilver Container/QuickSilver Text"
@onready var air_texture = $"VBoxContainer/Air Container/Air Texture"
@onready var air_text = $"VBoxContainer/Air Container/Air Text"
@onready var earth_texture = $"VBoxContainer/Earth Container/Earth Texture"
@onready var earth_text = $"VBoxContainer/Earth Container/Earth Text"
@onready var fire_texture = $"VBoxContainer/Fire Container/Fire Texture"
@onready var fire_text = $"VBoxContainer/Fire Container/Fire Text"
@onready var water_texture = $"VBoxContainer/Water Container/Water Texture"
@onready var water_text = $"VBoxContainer/Water Container/Water Text"


func _ready():
	print("HELLO I EXIST") 
	GameManager.runes_changed.connect(_on_runes_changed) # connected signal
	_on_runes_changed()

func _on_runes_changed():
	
	var runes : Dictionary = GameManager.get_runes()
	air_text.text = "I".repeat(runes["air"])
	fire_text.text = "I".repeat(runes["fire"])
	water_text.text = "I".repeat(runes["water"])
	earth_text.text = "I".repeat(runes["earth"])
	quicksilver_text.text = "I".repeat(runes["quicksilver"])
	
	if not runes["air"]:
		air_texture.modulate = Color.WEB_GRAY
	else:
		air_texture.modulate = Color.WHITE
	
	if not runes["fire"]:
		fire_texture.modulate = Color.WEB_GRAY
	else:
		fire_texture.modulate = Color.WHITE
	if not runes["water"]:
		water_texture.modulate = Color.WEB_GRAY
	else:
		water_texture.modulate = Color.WHITE
	if not runes["earth"]:
		earth_texture.modulate = Color.WEB_GRAY
	else:
		earth_texture.modulate = Color.WHITE
	if not runes["quicksilver"]:
		quicksilver_texture.modulate = Color.WEB_GRAY
	else:
		quicksilver_texture.modulate = Color.WHITE
