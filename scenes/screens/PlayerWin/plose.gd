extends Sprite2D



#play agian 
func _on_quit_button_pressed() -> void:
	get_tree().change_scene_to_file(tug.previous_scene)


func menu() -> void:
	get_tree().change_scene_to_file("res://scenes/minigames_select/selection_screen.tscn")
