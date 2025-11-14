extends RichTextLabel

var selected_word = global.randomword
var hideword = "_ "
var hidden_word = hideword.repeat(len(selected_word));
var guessed = false
var forsøk = 5
var guess = userGuess.guess
var letters = selected_word.split("")

#for gjettingen
var targetletter = str(letters)
var targetcomplete := str(selected_word)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = hidden_word
	print(selected_word)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass





func _on_line_edit_text_submitted(new_text: String) -> void:
	if guess != targetletter and guess != targetcomplete:
		print("wrong")
		forsøk -= 1
		print(userGuess.guess)
	
