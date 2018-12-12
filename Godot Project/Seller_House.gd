extends Control

var board = load("res://Selectchar.gd").new()

func _on_BackButton_pressed():
	get_tree().change_scene("res://NewGameScreen.tscn")

func _ready():
	$Animation_Container.show()
	$Animation_Container.seller_anim()


