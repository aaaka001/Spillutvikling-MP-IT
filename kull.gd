extends Area2D
@export var speed = 100
func _process(delta: float) -> void:
	position.y += speed*delta
	


func _on_timer_timeout() -> void:
	position.y = 0
	$Timer.start()

func _on_body_entered():
	pass
