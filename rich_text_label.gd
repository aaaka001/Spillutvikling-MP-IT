extends RichTextLabel

var selected_word = global.randomword
var hideword = "_ "
var hidden_word = hideword.repeat(len(selected_word));
var guessed = false
var forsøk = 5
var guess = userGuess.guess

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = hidden_word
	print(selected_word)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_line_edit_text_submitted(new_text: String) -> void:
		var split_guess = userGuess.text.split("")
		print(split_guess)
		print("guessed")
		for char in guess:
				print(char)
		
		for i in range(len(selected_word)):
			print(selected_word[i])
