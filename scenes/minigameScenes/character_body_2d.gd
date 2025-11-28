extends CharacterBody2D

@export var speed = 900
@export var jump_velocity: float = -500.0
@export var gravity: float = 800.0
var held_gifts: int = 0
var catch_area: Area2D
@export var speedmulti: float = 1.14
var direction: float = 0
@onready var animated_sprite = $Sprite




func get_input():
	var input_direction = Input.get_vector("left", "right", "ui_up", "ui_down").x
	direction = input_direction
	velocity.x = direction * speed
	

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
		
func _ready():

	catch_area = get_node("CatchArea")
	#catch_areaCoal = get_node("Sprite/CatchArea")
	catch_area.connect("area_entered", Callable(self, "_on_catch_area_entered"))
	#catch_areaCoal.connect("area_entered", Callable(self, "_on_catch_area_entered"))


	
func _on_catch_area_entered(area: Area2D) -> void:
	var item = area.get_parent() 

	var gift = area.get_parent()
	if gift.is_in_group("gift"):
		held_gifts += 1
		gift.queue_free()
		print("Caught a gift! Total:", held_gifts)
		Global.add_score(1)
		
		if held_gifts % 10 == 0:
			print("Speed increased")
			Global.gift_speed_multiplier *= 1.2
			speed = speed * speedmulti

	elif item.is_in_group("coal"):
		item.queue_free()
		handle_coal_hit()
		

func handle_coal_hit():
	print("Uff, you got a COAL")
	held_gifts = max(held_gifts - 1, 0)
	Global.add_score(-1)
	
func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/screens/victory_screen.tscn")
	


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		
	var collided = velocity.x == 0
	if collided and velocity.x != 0:
		velocity.x = 0
	
	update_animation()
	get_input()
	move_and_slide()
	
func update_animation():
	if velocity.x != 0:
		animated_sprite.play("walk")
		animated_sprite.flip_h = direction < 0
	else:
		animated_sprite.play("idle")
