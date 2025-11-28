extends Control

func _ready():
	var audio = $AudioStreamPlayer
	audio.stream = load("res://scenes/screens/menu/christmas-443109.mp3")
	audio.play()

func tug_of_war(event: InputEvent) -> void:
	if Input.is_action_just_released("press"):
		get_tree().change_scene_to_file("res://tug_of_war/tug_of_war.tscn")


func shoot_game(event: InputEvent) -> void:
	if Input.is_action_just_released("press"):
		get_tree().change_scene_to_file("res://minigame-map-scenes/Level4-map.tscn")


func hangman(event: InputEvent) -> void:
	if Input.is_action_just_released("press"):
		get_tree().change_scene_to_file("res://Hangman/hangman.tscn")

func diona_spill(event: InputEvent) -> void:
	if Input.is_action_just_released("press"):
		get_tree().change_scene_to_file("res://Build-A-Snowman/scenes/How-To-Play.tscn")

func grinch_run(event: InputEvent) -> void:
	if Input.is_action_just_released("press"):
		get_tree().change_scene_to_file("res://minigame-map-scenes/ParkourLevel.tscn")
