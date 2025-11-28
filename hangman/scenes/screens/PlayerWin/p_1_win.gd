extends Control
var winner: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var audio = $AudioStreamPlayer2D
	audio.stream = load("res://scenes/screens/PlayerWin/victory-chime-366449.mp3")
	audio.play()
	

	$"TextureButton/Label".text =  str(tug.winner_name) + "wins!"


func _process(delta: float) -> void:
	pass



func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/minigames_select/selection_screen.tscn")


func _on_play_again_pressed() -> void:
	get_tree().change_scene_to_file(tug.previous_scene)
