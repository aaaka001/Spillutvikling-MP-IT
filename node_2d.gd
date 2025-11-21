extends Node2D

var click_count: int = 0
var max_clicks: int = 3

func _on_button_pressed() -> void:
	click_count += 1

	if click_count >= max_clicks:
		get_tree().change_scene_to_file("res://scenes/screens/victory_screen.tscn")
