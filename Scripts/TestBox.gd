extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var tween = get_tree().create_tween()
	tween.tween_property($Sprite, "modulate", Color(Color.WHITE,0), 1)
	tween.tween_callback($Sprite.queue_free)
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
