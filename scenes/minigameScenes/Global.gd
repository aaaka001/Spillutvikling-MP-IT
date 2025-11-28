extends Node

var score: int = 0
var score_label: Label
var gift_speed_multiplier: float = 1.0
var player_speed_multiplier: float = 1.0


func register_score_label(label: Label):
	score_label = label
	update_score()

func add_score(amount: int):
	score += amount
	update_score()

func update_score():
	if score_label:
		self.text = "Score: " + str(score)
