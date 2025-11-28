extends Area2D

@export var correct_slot: String = ""
@export var victory_scene_path: String = "res://ResultScreens/scenes/victory-screen.tscn"

var start_pos: Vector2
var dragging := false
var current_slot: Area2D = null
var is_correct := false

static var all_draggables := []

func _ready():
	start_pos = position
	all_draggables.append(self)

func _exit_tree():
	if self in all_draggables:
		all_draggables.erase(self)


func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		dragging = event.pressed
		if not dragging:
			try_drop()

func _process(delta):
	if dragging:
		position = get_parent().to_local(get_global_mouse_position())

func _on_area_entered(area):
	if area is Area2D:
		current_slot = area

func _on_area_exited(area):
	if current_slot == area:
		current_slot = null

func try_drop():
	if current_slot and "slot_id" in current_slot and current_slot.slot_id == correct_slot:
		position = get_parent().to_local(current_slot.global_position)
		is_correct = true
	else:
		position = start_pos
		is_correct = false

	check_victory()

func check_victory():
	for d in all_draggables:
		if not d.is_correct:
			return

	print("You win!")
	if victory_scene_path != "":
		get_tree().change_scene_to_file(victory_scene_path)
