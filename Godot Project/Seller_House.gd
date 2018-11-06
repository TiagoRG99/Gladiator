extends Control


func _on_BackButton_pressed():
	get_tree().change_scene("res://NewGameScreen.tscn")

func _ready():
	$Animation_Container.show()
	$Animation_Container.seller_anim()