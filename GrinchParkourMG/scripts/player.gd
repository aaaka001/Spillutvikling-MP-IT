extends CharacterBody2D

const SPEED = 200
const GRAVITY = 900
const JUMP_FORCE = -300

func _physics_process(delta):
	velocity.x = SPEED         # Spilleren løper automatisk fremover
	velocity.y += GRAVITY * delta

	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMP_FORCE   # Hopper

	move_and_slide()
