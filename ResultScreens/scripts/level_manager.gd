extends Node

var scenes := [
	"res://minigame-map-scenes/Level4-map.tscn",
	"res://minigame-map-scenes/ParkourLevel.tscn"
]

var current_scene_index := 0

func change_scene_to(index: int) -> void:

	current_scene_index = index
	var scene_path = scenes[index]

	get_tree().change_scene_to_file(scene_path)
