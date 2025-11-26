extends Sprite2D

var win_detected = preload("res://scenes/screens/PlayerWin/p1win.tscn")
var clicksp1 = 0
var clicksp2 = 0
var winner_name = "none"


func _ready() -> void:
	pass
#	jukebox.playing_music()
		

	

	
	
func _process(delta: float) -> void:
	if Input.is_action_just_released("p1pull"):
		position.x -= 15
		clicksp1 += 1
	if Input.is_action_just_released("p2pull"):
		position.x += 15
		clicksp2 += 1



func _on_area_2d_2_area_entered(area: Area2D) -> void:
	#jukebox.juke_box.stop()
#	jukebox.juke_box.queue_free()  
	
	if area.name == "p2":
		winner_name = "Player 1"
		print("p1 win")
		
	if area.name == "p1":
		winner_name = "Player 2"
		print("p2 win")
	get_tree().change_scene_to_packed(win_detected)
		
		
		
