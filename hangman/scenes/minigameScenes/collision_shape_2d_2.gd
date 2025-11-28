extends Node2D   # or Area2D / StaticBody2D depending on your node

@export var side : String = "left"  # set "left" or "right" in the inspector

func _ready() -> void:
	# set a numeric x-limit based on the node's global position
	if side == "left":
		set_meta("camera_limit_left", global_position.x)
	elif side == "right":
		set_meta("camera_limit_right", global_position.x)

	if not is_in_group("camera_barrier"):
		add_to_group("camera_barrier")
