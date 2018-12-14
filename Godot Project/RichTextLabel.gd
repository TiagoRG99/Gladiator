extends RichTextLabel

var board = load("res://Selectchar.gd").new()

var dialog = [
	"Hey! My name is Benjamin.",
	"Small Health Potion. Costs 100 coins. Do You want to buy?",
	"Medium Health Potion. Costs 250 coins. Do You want to buy?",
	"Big Health Potion. Costs 500 coins. Do You want to buy?",
	"Small Stamina Potion. Costs 100 coins. Do You want to buy?",
	"Medium Stamina Potion. Costs 250 coins. Do You want to buy?",
	"Big Stamina Potion. Costs 500 coins. Do You want to buy?"]
	
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
