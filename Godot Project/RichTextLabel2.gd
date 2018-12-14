extends RichTextLabel

var board = load("res://Selectchar.gd").new()

var dialog = [
	"This will upgrade your Attack Stat. It costs "+ str(set_price(board.attack)) + " coins. Do You want to buy it?",
	"This will upgrade your Defence Stat. It costs "+ str(set_price(board.defence)) + " coins. Do You want to buy it?",
	"This will upgrade your Agility Stat. It costs "+ str(set_price(board.agility)) + " coins. Do You want to buy it?",
	"This will upgrade your Health Stat. It costs "+ str(set_price(board.health)) + " coins. Do You want to buy it?",
	"This will upgrade your Stamina Stat. It costs "+ str(set_price(board.stamina)) + " coins. Do You want to buy it?"]

var page = 0

func _ready():
	set_bbcode(dialog[page])
	set_visible_characters (0)



func _process (delta):
	board.carregar_dados()
	dialog = [
	"This will upgrade your Attack Stat. It costs "+ str(set_price(board.attack)) + " coins. Do You want to buy it?",
	"This will upgrade your Defence Stat. It costs "+ str(set_price(board.defence)) + " coins. Do You want to buy it?",
	"This will upgrade your Agility Stat. It costs "+ str(set_price(board.agility)) + " coins. Do You want to buy it?",
	"This will upgrade your Health Stat. It costs "+ str(set_price(board.health)) + " coins. Do You want to buy it?",
	"This will upgrade your Stamina Stat. It costs "+ str(set_price(board.stamina)) + " coins. Do You want to buy it?"]
	if board.check == 7:
		set_bbcode(dialog[page])
	if board.check == 8:
		set_bbcode(dialog[page+1])
	if board.check == 9:
		set_bbcode(dialog[page+2])
	if board.check == 10:
		set_bbcode(dialog[page+3])
	if board.check == 11:
		set_bbcode(dialog[page+4])


func set_price(x):
	if x==1:
		return 250
	elif x==2:
		return 350
	elif x==3:
		return 500
	elif x==4:
		return 750
	elif x==5:
		return 1000
	elif x==6:
		return 1250
	elif x==7:
		return 1500
	elif x==8:
		return 1750
	elif x==9:
		return 2000



func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
