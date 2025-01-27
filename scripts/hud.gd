extends Control

@onready var score: Label = $Score

func _ready() -> void:
	SignalManager.ON_SCORE_UPDATE.connect(on_score_update)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func on_score_update() -> void:
	score.text = str(ScoreManager.get_score())
	
