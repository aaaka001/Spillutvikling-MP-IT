extends Control

@onready var menu_button = $"Menu"
@onready var exit_button = $"Exit"
@onready var try_again_button = $Redo

func _ready():
	if menu_button == null:
		push_error("Menu button not found!")
		return
	if exit_button == null:
		push_error("Exit button not found!")
		return
	if try_again_button == null:
		push_error("Redo button not found!")
		return

	menu_button.pressed.connect(_on_menu_pressed)
	exit_button.pressed.connect(_on_quit_pressed)
	try_again_button.pressed.connect(_on_redo_pressed)

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/screens/menu_screen.tscn")

func _on_quit_pressed():
	get_tree().quit()

func _on_redo_pressed():
	level_manager.change_scene_to(level_manager.curent_scene_index)
