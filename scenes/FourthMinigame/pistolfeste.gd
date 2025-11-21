extends Node2D

var snøballene = preload("res://scenes/FourthMinigame/Snøballene.tscn")


# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("ui_accept"):
		var instance = snøballene.instantiate()
		instance.global_position = Vector2(global_position)
		get_tree().current_scene.add_child(instance)
		look_at(get_global_mouse_position())
	
