extends RichTextLabel

var selected_word = global.randomword
var hideword = "_ "
var hidden_word = hideword.repeat(len(selected_word));
var guessed = false
var forsøk = 5


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = hidden_word
	print(selected_word)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("enter"):
		print("guessed")
		var guess = UserGuess.guess
		for i in range(len(selected_word)):
			print(selected_word[i])


func _on_line_edit_text_changed(new_text: String) -> void:
	pass
