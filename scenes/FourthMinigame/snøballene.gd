extends RigidBody2D
var speed = 800

func _ready():
	look_at(get_global_mouse_position())

func _physics_process(delta):
	linear_velocity = Vector2.RIGHT.rotated(rotation) * speed


func _on_area_2d_body_entered(body: Node2D) -> void:
	body.queue_free()
	queue_free()


func _on_area_2d_area_entered(area: Area2D) -> void:
	pass
