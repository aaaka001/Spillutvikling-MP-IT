extends Control


func _on_texture_rect_6_gui_input(event: InputEvent) -> void:
	get_tree().change_scene_to_file("res://path/to/scene.tscn")
