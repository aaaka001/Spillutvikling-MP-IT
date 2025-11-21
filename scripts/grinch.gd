extends CharacterBody2D

@export var speed := 140.0
@export var jump_force := -350.0
@export var gravity := 900.0
@export var obstacle_check_distance := 20.0

var player

func _ready():
	player = get_parent().get_node("Player")


func _physics_process(delta):
	if not player:
		return

	# Horizontal chasing
	if player.global_position.x > global_position.x:
		velocity.x = speed
	else:
		velocity.x = -speed

	# Jump if obstacle ahead
	if is_on_floor() and _obstacle_in_front():
		velocity.y = jump_force

	# Gravity
	velocity.y += gravity * delta

	move_and_slide()


func _obstacle_in_front() -> bool:
	var space_state = get_world_2d().direct_space_state
	var from = global_position
	var to = global_position + Vector2(sign(velocity.x) * obstacle_check_distance, 0)

	var params = {
		"from": from,
		"to": to,
		"exclude": [self]
	}
	var result = space_state.intersect_ray(params)
	return result.size() > 0
