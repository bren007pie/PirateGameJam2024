extends Node2D

func _ready():
	Appear(2.0)
	wait(2.0)
	Disapear(2.0)

# Called when the node enters the scene tree for the first time.
func Appear(fade_time:float):
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_QUART)
	tween.tween_property($Sprite, "modulate", Color(Color.WHITE,1), fade_time)
	
func Disapear(fade_time:float):
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_QUART)
	tween.tween_property($Sprite, "modulate", Color(Color.WHITE,0), fade_time)


func wait(seconds: float) -> void: # Waited used for tweens to pause
	await get_tree().create_timer(seconds).timeout
