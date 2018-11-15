extends Control

var heroe_num = 1
var heroe_count = 3

func _ready():
	$player.set_texture(load("res://Sprites PI/Selectchar/heroe_1.png"))
	pass

func _on_Button_pressed():
	# Right Button
	heroe_num += 1
	if heroe_num > heroe_count:
		heroe_num = 1
	set_player() 

func _on_Button2_pressed():
	#Left Button
	heroe_num -= 1
	if heroe_num < 1 :
		heroe_num = heroe_count
	set_player() 
	
func set_player():
	$player.set_texture(load("res://Sprites PI/Selectchar/heroe_" + str(heroe_num) + ".png"))


func _on_Select_pressed():
	get_tree().change_scene("res://NewGameScreen.tscn")
