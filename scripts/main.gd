extends Control
@onready var highscore: Label = $MarginContainer/Score


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	highscore.text = str(ScoreManager.get_highScore())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("fly"):
		GameManager.on_load_game()
