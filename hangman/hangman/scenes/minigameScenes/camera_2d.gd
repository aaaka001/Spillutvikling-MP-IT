extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	
	var input := 0

	if Input.is_action_pressed("ui_right") or Input.is_action_pressed("right"):
		input += 1
	
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("left"):
		input -= 1

	position.x += input * 200 * delta  # 
