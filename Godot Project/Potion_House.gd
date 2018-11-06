extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	$Animation_Container.show()
	$Animation_Container.seller_anim()


func _on_BackButton_pressed():
	get_tree().change_scene("res://NewGameScreen.tscn")
