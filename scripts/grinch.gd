extends CharacterBody2D

@export var speed := 140.0
@export var jump_force := -350.0
@export var gravity := 900.0

# How far ahead to check for obstacles/platforms
@export var forward_check := 20.0
@export var ledge_check_distance := 20.0
@export var platform_check_height := 25.0

var player


func _ready():
	# Find the player anywhere in the currently loaded scene
	player = get_tree().current_scene.find_node("Player", true, false)
	if not player:
		print("Grinch: Player node not found!")


func _physics_process(delta):
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
	#   PARKOUR LOGIC
	# ------------------------------

	# 1. Jump over walls
	if is_on_floor() and _obstacle_in_front():
		velocity.y = jump_force

	# 2. Jump up onto platforms
	elif is_on_floor() and _platform_above():
		velocity.y = jump_force

	# 3. Jump across gaps/ledges
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
