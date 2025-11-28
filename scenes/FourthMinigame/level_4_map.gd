extends Node2D

var score = 0

func _ready():
	var player = get_node("Root")
	var timer = get_node("Timer")
	timer.timeout.connect(Callable(self,"_on_timer_timeout"))


func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	print("Timer finished")
	get_tree().change_scene_to_file("res://scenes/minigames_select/selection_screen.tscn")
