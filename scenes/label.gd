extends Label

var clicksp1 = tug.clicksp1

func _ready() -> void:
	pass




func _process(delta: float) -> void:
	self.text = str(tug.clicksp1)
#variabel for å tracke antall ganger trykket
	
	
