extends CharacterBody2D

@export var speed := 140.0
@export var jump_force := -350.0
@export var gravity := 900.0

@export var forward_check := 20.0
@export var ledge_check_distance := 20.0
@export var platform_check_height := 25.0

var player
@onready var anim = $AnimatedSprite2D  # AnimatedSprite2D reference

func _ready():
	# Safely find the player using group "player"
	var players = get_tree().get_nodes_in_group("player")
	if players.size() > 0:
		player = players[0]
	else:
		print("Grinch: Player not found! Make sure the Player node is in group 'player'")




	if not player:
		return

	# ------------------------------
	#   HORIZONTAL CHASE
	# ------------------------------
	if player.global_position.x > global_position.x:
		velocity.x = speed
	else:
		velocity.x = -speed

	# ------------------------------
	#   ANIMATION
	# ------------------------------
	if velocity.x != 0:
		# Only play "run" if it's not already playing
		if anim.animation != "run":
			anim.play("run")
	else:
		anim.stop()
		anim.frame = 0





	# ------------------------------
	#   PARKOUR LOGIC
	# ------------------------------
	if is_on_floor() and _obstacle_in_front():
		velocity.y = jump_force
	elif is_on_floor() and _platform_above():
		velocity.y = jump_force
	elif is_on_floor() and _ledge_ahead():
		velocity.y = jump_force

	# ------------------------------
	#   APPLY GRAVITY
	# ------------------------------
	velocity.y += gravity * delta
	move_and_slide()


# -------------------------------------------------------
#   SENSOR FUNCTIONS
# -------------------------------------------------------

# Detect wall/obstacle ahead
func _obstacle_in_front() -> bool:
	var from = global_position + Vector2(sign(velocity.x) * 12, -4)
	var to = from + Vector2(sign(velocity.x) * forward_check, 0)

	var q := PhysicsRayQueryParameters2D.create(from, to)
	q.exclude = [self]

	var result = get_world_2d().direct_space_state.intersect_ray(q)
	return result.size() > 0


# Detect ledge ahead (gap)
func _ledge_ahead() -> bool:
	var from = global_position + Vector2(sign(velocity.x) * 12, 4)
	var to = from + Vector2(0, ledge_check_distance)

	var q := PhysicsRayQueryParameters2D.create(from, to)
	q.exclude = [self]

	var result = get_world_2d().direct_space_state.intersect_ray(q)
	return result.size() == 0   # no ground → ledge


# Detect platform above for small jumps
func _platform_above() -> bool:
	var from = global_position + Vector2(sign(velocity.x) * 10, -4)
	var to = from + Vector2(0, -platform_check_height)

	var q := PhysicsRayQueryParameters2D.create(from, to)
	q.exclude = [self]

	var result = get_world_2d().direct_space_state.intersect_ray(q)
	return result.size() > 0
