extends RichTextLabel


var value = ""

func _on_user_input_text_submitted(new_text: String) -> void:
	var parent_node = get_parent()
	var value = parent_node.liv
	print(value)  
	
func _process(delta: float) -> void:
	self.text = value
	
