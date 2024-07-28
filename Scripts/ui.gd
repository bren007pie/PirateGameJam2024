extends CanvasLayer
@onready var quick_silver_texture = $"VBoxContainer/QuickSilver Container/QuickSilver Texture"
@onready var quick_silver_text = $"VBoxContainer/QuickSilver Container/QuickSilver Text"
@onready var air_texture = $"VBoxContainer/Air Container/Air Texture"
@onready var air_text = $"VBoxContainer/Air Container/Air Text"
@onready var earth_texture = $"VBoxContainer/Earth Container/Earth Texture"
@onready var earth_text = $"VBoxContainer/Earth Container/Earth Text"
@onready var fire_texture = $"VBoxContainer/Fire Container/Fire Texture"
@onready var fire_text = $"VBoxContainer/Fire Container/Fire Text"
@onready var water_texture = $"VBoxContainer/Water Container/Water Texture"
@onready var water_text = $"VBoxContainer/Water Container/Water Text"


func ready():
	GameManager.runes_changed.connect(_on_runes_changed) # connected signal
	print("HELLO I EXIST") 
	_on_runes_changed()

func _on_runes_changed():
	
	var runes : Dictionary = GameManager.get_runes()
	air_text.text = String(runes["air"])
	fire_text.text = String(runes["fire"])
	
