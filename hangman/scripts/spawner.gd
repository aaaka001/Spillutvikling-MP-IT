extends Node2D

@export var coal_scene: PackedScene
@export var gift_scene: PackedScene   
@export var coal_spawn_interval: float = 2.3
@export var gift_spawn_interval: float = 1.0


var coal_timer: float = 0.0
var gift_timer: float = 0.0

var screen_width: float = 1024.0  

func _ready():
	coal_timer = coal_spawn_interval
	gift_timer = gift_spawn_interval

	screen_width = get_viewport_rect().size.x

func _process(delta: float) -> void:
	coal_timer -= delta
	if coal_timer <= 0:
		spawn_coal()
		coal_timer = coal_spawn_interval
		
	gift_timer -= delta
	if gift_timer <= 0:
		spawn_gift()
		gift_timer = gift_spawn_interval

func spawn_coal() -> void:	
	if not coal_scene:
		return
	var coal = coal_scene.instantiate()
	var x = randf_range(0, screen_width)
	coal.position = Vector2(x, -50)
	get_parent().add_child(coal)
	
	coal.fall_speed *= Global.gift_speed_multiplier

func spawn_gift() -> void:
	if not gift_scene:
		return
	var gift = gift_scene.instantiate()
	var x = randf_range(0, screen_width)
	gift.position = Vector2(x, -50)
	get_parent().add_child(gift)  
	
	gift.fall_speed *= Global.gift_speed_multiplier
