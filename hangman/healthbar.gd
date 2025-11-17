extends RichTextLabel


@onready var livnode = get_node("../generatedWord")
var liv = 5



func _on_user_input_text_submitted(new_text: String) -> void:
	liv = livnode.liv
	print(liv)  
	
func _process(delta: float) -> void:
	self.text = str(liv)
	
