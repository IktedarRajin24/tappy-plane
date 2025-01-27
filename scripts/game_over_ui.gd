extends Control
@onready var game_over_label: Label = $GameOverLabel
@onready var retry_label: Label = $RetryLabel
@onready var timer: Timer = $Timer
@onready var game_over_audio: AudioStreamPlayer = $GameOverAudio


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	SignalManager.ON_PLANE_CRASH.connect(on_plane_crash)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if retry_label.visible and Input.is_action_just_pressed("fly"):
		GameManager.on_main_game()
		
func on_plane_crash()-> void:
	show()
	game_over_audio.play()
	timer.start()

func _on_timer_timeout() -> void:
	game_over_label.hide()
	retry_label.show()
