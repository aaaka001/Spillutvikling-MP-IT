extends Sprite2D


var location = global_position


func _on_area_2d_mouse_shape_entered(shape_idx: int) -> void:
	print("gamedone")

func _process(delta: float) -> void:
	var cursor = get_viewport().get_mouse_position()
	if Input.is_action_just_pressed("mb1") and cursor == location:
		self.visible = false  
		print("wow")


func _on_area_2d_mouse_entered() -> void:
	print("hi")
