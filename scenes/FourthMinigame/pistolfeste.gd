extends Node2D

var snøballene = preload("res://scenes/FourthMinigame/Snøballene.tscn")

func _process(_delta):
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("ui_accept"):
		var instance = snøballene.instantiate()
		instance.global_position = Vector2(global_position)
		get_tree().current_scene.add_child(instance)
		look_at(get_global_mouse_position())
	
