extends AnimatedSprite

var board = load("res://Selectchar.gd").new()

var health = 100
var stamina = 100


func _on_Timer_timeout():
	board.carregar_dados()
	if board.stage>13:
		get_tree().change_scene("res://Victory.tscn")
	else:
		get_tree().change_scene("res://NewGameScreen.tscn")
