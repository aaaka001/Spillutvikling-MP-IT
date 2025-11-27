extends Node

var scenes := [
	"res://GrinchParkourMG/scenes/ParkourLevel.tscn",
	
]

var current_scene_index := 0

func change_scene_to(index: int) -> void:

	current_scene_index = index
	var scene_path = scenes[index]

	get_tree().change_scene_to_file(scene_path)
