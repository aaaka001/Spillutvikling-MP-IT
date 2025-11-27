extends Area2D

@export var slot_id: String = ""
var is_hovered := false

func _on_area_entered(area):
	is_hovered = true

func _on_area_exited(area):
	is_hovered = false
