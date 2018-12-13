extends Polygon2D

var board2 = load ("res://Potion_House.gd").new()

var dialog = ["Hello World !"]
var page = 0

func _ready():
	var asd = board2.valor_check ()
	print (asd)
	if board2.valor_check () == 1:
		dialog = ["BASD"]
		set_bbcode(dialog[page])
		set_visible_characters (0)
		set_process_input(true)
	if board2.valor_check () == 2:
		dialog = ["BASDasd"]
		set_bbcode(dialog[page])
		set_visible_characters (0)
		set_process_input(true)
	if board2.valor_check () == 3:
		dialog = ["BfasfASD"]
		set_bbcode(dialog[page])
		set_visible_characters (0)
		set_process_input(true)
	if board2.valor_check () == 4:
		dialog = ["BAgtdaSD"]
		set_bbcode(dialog[page])
		set_visible_characters (0)
		set_process_input(true)
	if board2.valor_check () == 5:
		dialog = ["BafsASD"]
		set_bbcode(dialog[page])
		set_visible_characters (0)
		set_process_input(true)
	if board2.valor_check () == 6:
		dialog = ["BgasfdASD"] 
		set_bbcode(dialog[page])
		set_visible_characters (0)
		set_process_input(true)
