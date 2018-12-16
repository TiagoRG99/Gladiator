extends Control

var board = load("res://Selectchar.gd").new()
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if board.stage==4 || board.stage==9 || board.stage==14:
		$"Fight!".disabled=true


func _on_Back_pressed():
	get_tree().change_scene("res://NewGameScreen.tscn")


func _on_Boss_pressed():
	if board.stage<4:
		board.stage=4
	elif board.stage>4 || board.stage<9:
		board.stage=9
	elif board.stage>9:
		board.stage=14
	get_tree().change_scene("res://Colosseum.tscn")


func _on_Fight_pressed():
	get_tree().change_scene("res://Colosseum.tscn")
