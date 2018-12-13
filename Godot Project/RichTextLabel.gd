extends RichTextLabel

var board = load("res://Selectchar.gd").new()

var dialog = [
	"Hey! My name is Benjamin.",
	"Welcome to my Godot dialog tutorial.",
	"asdsdsa",
	"asdasgwedq13",
	"asdfq32e3r33",
	"MANSNFSA",
	"TWEQWSDA"]
	
var page = 0

func _ready():
	set_bbcode(dialog[page])
	set_visible_characters (0)
	
func _process (delta):
	board.carregar_dados()
	if board.check == 1:
		set_bbcode(dialog[page+1])
	if board.check == 2:
		set_bbcode(dialog[page+2])
	if board.check == 3:
		set_bbcode(dialog[page+3])
	if board.check == 4:
		set_bbcode(dialog[page+4])
	if board.check == 5:
		set_bbcode(dialog[page+5])
	if board.check == 6:
		set_bbcode(dialog[page+6])
	
func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
