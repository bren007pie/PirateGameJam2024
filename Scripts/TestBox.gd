extends Node2D

func _ready():
	Appear(1.0)

# Called when the node enters the scene tree for the first time.
func Appear(hold_time: float):
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_QUART)
	tween.tween_property($Sprite, "modulate", Color(Color.WHITE,1), 2)
	#tween.pause() could pause play based on walking away or something with a raycast
	wait(hold_time) # Can wait here for something else like a confirmation if we want
	tween.tween_property($Sprite, "modulate", Color(Color.WHITE,0), 2)
	tween.tween_callback($Sprite.queue_free)

func wait(seconds: float) -> void: # Waited used for tweens to pause
	await get_tree().create_timer(seconds).timeout
