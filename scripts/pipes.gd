extends Node2D

class_name PIPES
@onready var score_sound: AudioStreamPlayer = $ScoreSound


const OFF_SCREEN_BOUND: float = -500.0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= GameManager.PIPE_SPEED * delta


func check_screen_exited()-> void:
	if position.x < OFF_SCREEN_BOUND:
		queue_free()

func _on_screen_exited() -> void:
	queue_free()
	


func _on_pipe_entered(body: Node2D) -> void:
	#if body.is_in_group(GameManager.PLANE_GROUP):
		#if body.has_method("die"):
			#body.die()
	if body is Tappy:
		if body.has_method("die"):
			body.die()


func _on_laser_entered(body: Node2D) -> void:
	if body is Tappy:
		score_sound.play()
		ScoreManager.increment_score()
