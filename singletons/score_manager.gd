extends Node

var _score: int = 0
var _highScore: int = 0

const SCORES_PATH = "user://tappy_plane.dat"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_score()


func get_score() -> int:
	return _score
	
func get_highScore() -> int:
	return _highScore
	
func set_score(value: int)-> void:
	_score = value
	if _score > _highScore:
		_highScore = _score
	SignalManager.ON_SCORE_UPDATE.emit()

func increment_score()-> void:
	set_score(_score + 1)
	
func load_score()-> void:
	var file = FileAccess.open(SCORES_PATH, FileAccess.READ)
	if file:
		if file.get_length() > 0:
			_highScore = file.get_32()
		else:
			_highScore - 0
		file.close()
	else:
		print("No files")

func save_score() -> void:
	var file = FileAccess.open(SCORES_PATH, FileAccess.WRITE)
	if file:
		file.store_32(_highScore)
		file.close()
		

func _process(delta: float) -> void:
	pass
	
	
