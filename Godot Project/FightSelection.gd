extends Control

var board = load("res://Selectchar.gd").new()



func _process(delta):
	board.carregar_dados()
	if board.stage==4 || board.stage==9 || board.stage==14:
		$"Fight!".disabled=true


func _on_Back_pressed():
	get_tree().change_scene("res://NewGameScreen.tscn")




func _on_Boss_pressed():
	board.carregar_dados()
	if board.stage<4:
		board.stage=4
	elif board.stage>4 || board.stage<9:
		board.stage=9
	elif board.stage>9:
		board.stage=14
	board.salvar_dados()
	get_tree().change_scene("res://Colosseum.tscn")







func _on_Fight_pressed():
	get_tree().change_scene("res://Colosseum.tscn")




