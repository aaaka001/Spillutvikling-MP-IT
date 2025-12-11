extends RichTextLabel

var selected_word = global.randomword
var hideword = "_ "
var hidden_word = hideword.repeat(len(selected_word)); #hider bokstaver i lengden til ordet så bruker ikke kan se det by default
var guessed = false #sjekker om den har blitt gjettet
var liv = 5 #hvor mange forsøk brukeren har 
var guess = userGuess.guess #guess fra input fielden
var letters = selected_word.split("") #splitter ordet for å kunne indexe og finne riktige bokstaver senere

	#for gjettingen
var targetletter = str(letters) 
var targetcomplete := str(selected_word)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = hidden_word
	print(selected_word)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if text == selected_word:
		tug.previous_scene = get_tree().current_scene.scene_file_path
		guessed == true
		get_tree().change_scene_to_file("res://ResultScreens/scenes/victory-screen.tscn") #switch to victory screen if they guessed the word
	if liv == 0:
		tug.previous_scene = get_tree().current_scene.scene_file_path
		get_tree().change_scene_to_file("res://ResultScreens/scenes/defeat-screen.tscn") #switch to defeat if you run out of lives
		





func _on_line_edit_text_submitted(new_text: String) -> void:
	var split_guess = new_text.split("")  #split guesset for å sammenligne bokstavene med splittet riktig ordet
	var word_length = len(selected_word) #lager variabel for å sammenligne med guesset osv
	
	
	#sjekker at de ikke gjør det fort langtmen også at ingen bokstaver eller ordet ikke matcher
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
		print(split_guess)
		for guess_letter in split_guess:
			for i in range(word_length):
				if letters[i] == guess_letter:
					hidden_word = hidden_word.substr(0, i*2) + guess_letter + hidden_word.substr(i*2 + 1) 
					#substr for å replace bokstav basert på indexen hvis den matcher bokstaven du gjetttet
		text = hidden_word
