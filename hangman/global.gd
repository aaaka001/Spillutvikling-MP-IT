extends Node

var wordlist = ["santa", "reindeer", "cinnamon", "eggnog", "elf", "elves", "north pole", "sleigh", "presents", "christmas tree", "gift", "bell", "star", "tree", "snow", "coal", "santa", "rudolf", "ornament", "carols", "sleigh", "tinsel", "snowflake", "gingerbread", "north pole", "mistletoe", "stockings", "candy cane", "reindeer", "holiday", "festive", "icicle", "yule log", "jingle", "evergreen", "poinsettia", "nativity", "wreath", "present", "elves", "toy shop", "santa sleigh", "christmas", "joyful", "merry", "frosty", "carolers", "celebration", "december", "wintertime", "hot chocolate", "snowman"
]

var strikes = 0
var randomword = wordlist[randi() % wordlist.size()]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
