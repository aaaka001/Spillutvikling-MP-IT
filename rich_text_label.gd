extends RichTextLabel

var selected_word = global.randomword
var hideword = "_ "
var hidden_word = hideword.repeat(len(selected_word));
var guessed = false
var liv = 5
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
	if new_text != targetletter and new_text != targetcomplete:
		print(new_text)
		liv -= 1
	if new_text == targetcomplete:
		text = new_text
		print("correct") 
		text = targetcomplete
	if new_text == targetletter:
		print("correct") 
		text = targetletter
	
	
