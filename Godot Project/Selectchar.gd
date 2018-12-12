extends Control

var hero_num = 1
var hero_count = 3
const ARQUIVO = "user://save.data"

func _ready():
	carregar_dados()
	$player.set_texture(load("res://Sprites PI/Selectchar/hero_" + str(hero_num) + ".png"))
	pass

func _on_Button_pressed():
	# Right Button
	hero_num += 1
	if hero_num > hero_count:
		hero_num = 1
	set_player() 

func _on_Button2_pressed():
	#Left Button
	hero_num -= 1
	if hero_num < 1 :
		hero_num = hero_count
	set_player() 
	
func set_player():
	$player.set_texture(load("res://Sprites PI/Selectchar/hero_" + str(hero_num) + ".png"))
	salvar_dados()
	valor_char()


func _on_Select_pressed():
	get_tree().change_scene("res://NewGameScreen.tscn")
	
func valor_char ():
	var hero = hero_num
	return hero
	
func salvar_dados():
	var arquivo = File.new()
	var erro = arquivo.open(ARQUIVO, File.WRITE)
	
	var dados = {"hero value" : hero_num }
	
	if not erro :
		arquivo.store_var(dados)
	else:
		print ("Erro ao salvar dados")
	
	arquivo.close()
	
func carregar_dados():
	var arquivo = File.new()
	var erro = arquivo.open(ARQUIVO, File.READ)
	
	
	if not erro :
		var dados_salvos = arquivo.get_var()
		hero_num = dados_salvos["hero value"]
		print (dados_salvos)
	else:
		print ("Erro ao salvar dados")
	
	arquivo.close()
	
	
