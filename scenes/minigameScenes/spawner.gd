extends Node2D

@export var gift_scene: PackedScene   # drag your Gift.tscn here
@export var spawn_interval: float = 1.0

var spawn_timer: float = 0.0
var screen_width: float = 1024.0  # adjust to your viewport width

func _ready():
	spawn_timer = spawn_interval
	screen_width = get_viewport_rect().size.x

func _process(delta: float) -> void:
	spawn_timer -= delta
	if spawn_timer <= 0:
		spawn_gift()
		spawn_timer = spawn_interval

func spawn_gift() -> void:
	if not gift_scene:
		return
	var gift = gift_scene.instantiate()
	var x = randf_range(0, screen_width)
	gift.position = Vector2(x, -50)
	get_parent().add_child(gift)  
	
	gift.fall_speed *= Global.gift_speed_multiplier
