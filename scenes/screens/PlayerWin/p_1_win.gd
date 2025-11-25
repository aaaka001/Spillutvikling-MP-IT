extends Control
var winner: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var audio = $AudioStreamPlayer2D
	audio.stream = load("res://scenes/screens/PlayerWin/victory-chime-366449.mp3")
	audio.play()
	
	winner = tug.winner_name
	$"TextureButton/Label".text =  winner + "wins!"


func _process(delta: float) -> void:
	pass



func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://blablabla.tscn")


func _on_play_again_pressed() -> void:
	get_tree().change_scene_to_file("res://tug_of_war/tug_of_war.tscn")
