extends TextureButton

@export var atlas_on: AtlasTexture
@export var atlas_off: AtlasTexture

@onready var music = $"../MusicPlayer"

func _ready():
	# Set initial visual
	texture_normal = atlas_on



func _on_toggled(toggled_on: bool) -> void:
	if button_pressed:
		# Muted
		music.volume_db = -80
		texture_normal = atlas_off
	else:
		# Unmuted
		music.volume_db = 0
		texture_normal = atlas_on
