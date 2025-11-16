extends Sprite2D


var location = self.location()


func _on_area_2d_mouse_shape_entered(shape_idx: int) -> void:
	print("gamedone")

func _process(delta: float) -> void:
	print(location)


	self.visible = false  
