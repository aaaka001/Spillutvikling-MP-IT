extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var player = get_node("Root")  
	var timer = get_node("Timer")
	timer.timeout.connect(Callable(player, "_on_timer_timeout"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	print("Timer finished")
	get_tree().change_scene_to_file("res://scenes/screens/victory_screen.tscn")
