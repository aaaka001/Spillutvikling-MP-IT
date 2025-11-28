extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



	if Input.is_action_just_released("press"):
		get_tree().change_scene_to_file("res://scenes/minigames_select/selection_screen.tscn")


func _on_texture_button_gui_input(event: InputEvent) -> void:
	if Input.is_action_just_released("press"):
		get_tree().change_scene_to_file("res://scenes/minigames_select/selection_screen.tscn")
