extends Node2D

func _ready():
	pass

# Called when the node enters the scene tree for the first time.
func Appear(fade_time:float):
	print_debug("Appearing")
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_QUART)
	tween.tween_property($Sprite, "modulate", Color(Color.WHITE,1), fade_time)
	
func Disapear(fade_time:float):
	print_debug("Disappearing")
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_QUART)
	tween.tween_property($Sprite, "modulate", Color(Color.WHITE,0), fade_time)

func change_colour(fade_time:float):
	print_debug("changing colour")
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_BOUNCE)
	tween.tween_property($Sprite, "modulate", Color.from_hsv(randf(),1,1), fade_time)
