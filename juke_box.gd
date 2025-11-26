extends TextureButton
var jukeboximg = preload("res://jukebox/jukebox.png")
var jukeboxmuted = preload("res://jukebox/mutedjukebox.png")
var juke_box = AudioStreamPlayer.new()


func _ready():
	texture_normal = jukeboximg
	add_child(juke_box)
	juke_box.stream = preload("res://jukebox/menumusic.mp3")
	juke_box.volume_db = -30
	juke_box.bus = "Master"
	juke_box.play()
	

func interact():
	pass


func _on_pressed() -> void:
	if texture_normal == jukeboximg:
		texture_normal = jukeboxmuted
	elif texture_normal == jukeboxmuted:
		texture_normal = jukeboximg
	

		
		
func playing_music():
	pass
	
