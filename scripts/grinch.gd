extends CharacterBody2D

const SPEED = 140
var player

func _ready():
	player = get_parent().get_node("Player")

func _physics_process(delta):
	if player:
		# Bare følg spilleren veldig enkelt
		var dir = (player.global_position - global_position).normalized()
		velocity = dir * SPEED
		move_and_slide()

extends CharacterBody2D

@export var speed := 120.0
@export var jump_force := -350.0

var player

func _ready():
	player = get_parent().get_node("Player")

func _physics_process(delta):

	if not player:
		return

	# Alltid løp mot spilleren
	if player.position.x > position.x:
		velocity.x = speed
	else:
		velocity.x = -speed

	# Hvis hindring foran → hopp
	if is_on_floor() and _obstacle_in_front():
		velocity.y = jump_force

	# Gravity
	velocity.y += 900 * delta

	move_and_slide()

func _obstacle_in_front() -> bool:
	# Raycast fremover for å oppdage hindring
	var space_state = get_world_2d().direct_space_state
	var from = global_position
	var to = global_position + Vector2(sign(velocity.x) * 20, 0)

	var result = space_state.intersect_ray(from, to, [self])

	return result.size() > 0
