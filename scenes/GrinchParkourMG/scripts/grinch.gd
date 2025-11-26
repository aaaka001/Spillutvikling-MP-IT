extends CharacterBody2D

const SPEED = 180
const GRAVITY = 900
const JUMP_FORCE = -350

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta):
	velocity.x = SPEED
	velocity.y += GRAVITY * delta

	move_and_slide()

func _on_detecter_area_entered(area: Area2D) -> void:
	velocity.y = JUMP_FORCE   # Hopper

	anim.play("run")
