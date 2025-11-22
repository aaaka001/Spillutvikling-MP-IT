extends Sprite2D

var p1win = preload("res://scenes/screens/p1win.tscn")
var p2win = preload("res://scenes/screens/p2win.tscn")
var clicksp1 = 0
var clicksp2 = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released("p1pull"):
		position.x -= 15
		clicksp1 += 1
	if Input.is_action_just_released("p2pull"):
		position.x += 15
		clicksp2 += 1



func _on_area_2d_2_area_entered(area: Area2D) -> void:
	if area.name == "p2":
		get_tree().change_scene_to_packed(p1win)
	if area.name == "p1":
		get_tree().change_scene_to_packed(p2win)
