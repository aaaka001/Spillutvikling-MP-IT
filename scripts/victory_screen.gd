extends Control

func _ready():
	$VBoxContainer/MenuButton.pressed.connect(_on_menu_pressed)
	$VBoxContainer/QuitButton.pressed.connect(_on_quit_pressed)


func show_screen():
	visible = true


func _on_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/menu_screen.tscn")


func _on_quit_pressed():
	pass
