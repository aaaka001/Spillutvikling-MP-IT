extends Camera2D

@export var player: Node2D
@export var left_limit: Node2D
@export var right_limit: Node2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if player == null or left_limit == null or right_limit == null:
		return
		
	var target_x = player.global_position.x
	var min_x = left_limit.global_position.x
	var max_x = right_limit.global_position.x
	
	global_position.x = clamp(target_x, min_x, max_x)

	
	var input := 0

	if Input.is_action_pressed("ui_right") or Input.is_action_pressed("right"):
		input += 1
	
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("left"):
		input -= 1

	position.x += input * 200 * delta  # 
