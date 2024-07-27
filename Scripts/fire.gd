extends StaticBody2D
var has_fire = true

# Called when the node enters the scene tree for the first time.
func _ready():
	Shabah.interactable_entered.connect(_on_interactable_entered)
	Shabah.interactable_exited.connect(_on_interactable_exited)
	Shabah.interactable_interacted.connect(_on_interactable_interacted)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_interactable_entered(interactable):
	if interactable == self:
		print("I was entered")

func _on_interactable_exited(interactable):
	if interactable == self:
		print("I was exiteded")

func _on_interactable_interacted(interactable):
	if interactable == self and has_fire:
		print("I was interacted")
		GameManager.add_rune("fire")
		has_fire = false
		$Sprite2D.modulate = Color.GREEN
