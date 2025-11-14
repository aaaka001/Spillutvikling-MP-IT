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
