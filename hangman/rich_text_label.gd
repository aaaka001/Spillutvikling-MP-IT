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
	tug.previous_scene = get_tree().current_scene.scene_file_path


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if text == selected_word:
		guessed == true
		get_tree().change_scene_to_file("res://ResultScreens/scenes/victory-screen.tscn")
	if liv == 0:
		get_tree().change_scene_to_file("res://ResultScreens/scenes/defeat-screen.tscn")
		





func _on_line_edit_text_submitted(new_text: String) -> void:
	var split_guess = new_text.split("") 
	var word_length = len(selected_word)
	var correct = false
	
	
	
	if new_text != targetletter and new_text != targetcomplete and len(new_text) <= word_length:
		print(new_text)	
		liv -= 1
	if len(new_text) >= word_length:
		print("NO")
	if new_text == targetcomplete:
		text = new_text
		print("correct") 
		text = targetcomplete
		guessed = true

		
	if new_text != targetcomplete and len(new_text) <= word_length:
		print("testing")
		print(split_guess)
		for guess_letter in split_guess:
			for i in range(word_length):
				if letters[i] == guess_letter:
					hidden_word = hidden_word.substr(0, i*2) + guess_letter + hidden_word.substr(i*2 + 1)
		text = hidden_word
