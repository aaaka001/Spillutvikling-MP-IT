extends RigidBody2D
var speed = 800


func _ready():
	look_at(get_global_mouse_position())

func _physics_process(delta):
	linear_velocity = Vector2.RIGHT.rotated(rotation) * speed


func _on_area_2d_body_entered(body: Node2D) -> void:
	Minigame4.update_points(1)
	body.queue_free()
	queue_free()


func _on_area_2d_area_entered(area: Area2D) -> void:
	print("KULLLLLLL")
	get_tree().change_scene_to_file("res://minigame-map-scenes/Level4-map.tscn")
