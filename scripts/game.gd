extends Node2D
const PIPES = preload("res://scenes/pipes/pipes.tscn")
@onready var spawn_up: Marker2D = $Marker2D01
@onready var spawn_down: Marker2D = $Marker2D02
@onready var pipes_spawner: Node = $pipes_spawner
@onready var timer: Timer = $Timer



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_pipes()
	ScoreManager.set_score(0)
	SignalManager.ON_PLANE_CRASH.connect(_on_plane_crash)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_pipes()-> void:
	var new_pipes:PIPES = PIPES.instantiate()
	var y_pos: float = randf_range(spawn_up.position.y, spawn_down.position.y)
	new_pipes.global_position = Vector2(spawn_down.position.x, y_pos)
	pipes_spawner.add_child(new_pipes)


func _on_timer_timeout() -> void:
	spawn_pipes()
	
func stop_spawn_pipes() -> void:
	timer.stop()
	for pipe in pipes_spawner.get_children():
		pipe.set_process(false)


func _on_plane_crash() -> void:
	stop_spawn_pipes()
	ScoreManager.save_score()
	
