extends Area2D


var location = global_position



func _ready():
	print(location)


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/victoryscreenfindsanta.tscn")
	print("victory")
