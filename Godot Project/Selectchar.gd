extends Control

var heroe_num = 1
var heroe_count = 3
const ARQUIVO = "user://save.data"

func _ready():
	carregar_dados()
	$player.set_texture(load("res://Sprites PI/Selectchar/heroe_" + str(heroe_num) + ".png"))
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
	salvar_dados()


func _on_Select_pressed():
	get_tree().change_scene("res://NewGameScreen.tscn")
	
func salvar_dados():
	var arquivo = File.new()
	var erro = arquivo.open(ARQUIVO, File.WRITE)
	
	var dados = {"heroe value" : heroe_num }
	
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
		heroe_num = dados_salvos["heroe value"]
		print (dados_salvos)
	else:
		print ("Erro ao salvar dados")
	
	arquivo.close()
	
	
