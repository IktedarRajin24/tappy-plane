extends ParallaxBackground


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.ON_PLANE_CRASH.connect(on_plane_crash)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	scroll_offset.x += GameManager.SCROLL_SPEED * delta


func on_plane_crash()-> void:
	set_process(false)
