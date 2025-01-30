extends ParallaxLayer

const  Image_W: float = 1920.0
const  Image_H: float = 1080.0


@onready var bg_1: Sprite2D = $Bg_1

@export var texture: Texture2D
@export var scroll_scale: float = 0.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	motion_scale.x = scroll_scale
	var scale_f = get_viewport_rect().size.y/Image_H
	bg_1.texture = texture
	bg_1.scale = Vector2(scale_f, scale_f)
	motion_mirroring.x = Image_W * scale_f
	
