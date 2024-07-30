extends StaticBody2D
@onready var test_box = $TestBox
# Called when the node enters the scene tree for the first time.
func _ready():
	Shabah.interactable_entered.connect(_on_interactable_entered)
	Shabah.interactable_exited.connect(_on_interactable_exited)
	Shabah.interactable_interacted.connect(_on_interactable_interacted)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_interactable_entered(interactable):
	print(interactable)
	if interactable == self:
		print("I was entered")
		test_box.Appear(1.)
	else:
		print("someone else was entered")

func _on_interactable_exited(interactable):
	if interactable == self:
		print("I was exiteded")
		test_box.Disapear(1.)
	else:
		print("someone else was exited")

func _on_interactable_interacted(interactable):
	if interactable == self:
		# Interface for the puzzles be here.
		# Puzzle script would go in here
		print("I was interacted")
		test_box.change_colour(1)
	else:
		print("someone else was interacted")
