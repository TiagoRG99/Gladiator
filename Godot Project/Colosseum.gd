extends Control



func _on_menuButton_pressed():
	get_tree().change_scene("res://NewGameScreen.tscn")




func _on_Walk_Left_pressed():
	$TextureRect/Player.animation = "Walk_Elf_1"


func _on_Power_Attack_pressed():
	$TextureRect/Player.animation = "Attack_Elf_1"


func _on_Normal_Attack_pressed():
	$TextureRect/Player.animation = "Attack_Elf_1"


func _on_Walk_Right_pressed():
	$TextureRect/Player.animation = "Walk_Elf_1"



