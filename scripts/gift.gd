extends Node2D

@export var fall_speed: float = 300.0
@export var is_coal: bool = false #senere

var area: Area2D

func _ready():
	area = get_node("Area2D")
	area.connect("area_entered", Callable(self, "_on_area_entered"))

func _physics_process(delta: float) -> void:
	position.y += fall_speed * delta
	if position.y > get_viewport_rect().size.y + 50:
		queue_free()

func _on_area_entered(other_area: Area2D) -> void:
	queue_free()
	if other_area.get_parent().name == "gift":
		queue_free()  
