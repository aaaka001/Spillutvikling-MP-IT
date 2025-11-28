extends Area2D

@export var slot_id: String = ""
var is_hovered := false

func _ready():
	tug.previous_scene = get_tree().current_scene.scene_file_path

func _on_area_entered(area):
	is_hovered = true

func _on_area_exited(area):
	is_hovered = false

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://ResultScreens/scenes/defeat-screen.tscn")


func _on_music_button_pressed() -> void:
	pass # Replace with function body.
