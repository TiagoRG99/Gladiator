extends Control

var board = load("res://Selectchar.gd").new()

func _ready():
	$Animation_Container.show()
	$Animation_Container.seller_anim()


func _on_BackButton_pressed():
	get_tree().change_scene("res://NewGameScreen.tscn")
