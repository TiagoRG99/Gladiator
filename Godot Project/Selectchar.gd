extends Control

var heroe_num = 1
var heroe_count = 3
var attack
var agility
var stamina
var health
var defence


const ARQUIVO = "user://save.data"

func _process(delta):
	if heroe_num == 1:
		$VBoxContainer/Class/LabelName.text = "Elf"
		$VBoxContainer/Class2/LabelAttack.text = "2"
		$VBoxContainer/Class3/LabelAgility.text = "3"
		$VBoxContainer/Class4/LabelStamina.text = "1"
		$VBoxContainer/Class5/LabelHealth.text = "2"
		$VBoxContainer/Class6/LabelDefence.text = "1"
	elif heroe_num == 2:
		$VBoxContainer/Class/LabelName.text = "Knight"
		$VBoxContainer/Class2/LabelAttack.text = "3"
		$VBoxContainer/Class3/LabelAgility.text = "1"
		$VBoxContainer/Class4/LabelStamina.text = "1"
		$VBoxContainer/Class5/LabelHealth.text = "2"
		$VBoxContainer/Class6/LabelDefence.text = "2"
	elif heroe_num == 3:
		$VBoxContainer/Class/LabelName.text = "W Warrior"
		$VBoxContainer/Class2/LabelAttack.text = "2"
		$VBoxContainer/Class3/LabelAgility.text = "2"
		$VBoxContainer/Class4/LabelStamina.text = "2"
		$VBoxContainer/Class5/LabelHealth.text = "1"
		$VBoxContainer/Class6/LabelDefence.text = "2"


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
	if heroe_num == 1:
		attack = 2
		agility = 3
		stamina = 1
		health = 2
		defence = 1
	if heroe_num == 2:
		attack = 3
		agility = 1
		stamina = 1
		health = 2
		defence = 2
	if heroe_num == 3:
		attack = 2
		agility = 2
		stamina = 2
		health = 1
		defence = 2
	salvar_dados()
	valor_char()


func _on_Select_pressed():
	get_tree().change_scene("res://NewGameScreen.tscn")
	
func valor_char ():
	var heroe = heroe_num
	return heroe
	
func salvar_dados():
	var arquivo = File.new()
	var erro = arquivo.open(ARQUIVO, File.WRITE)
	
	var dados = {"heroe value" : heroe_num, "attack value" : attack, "agility value" : agility, "stamina value" : stamina, "health value" : health, "defence value" : defence, }
	
	if not erro :
		arquivo.store_var(dados)
	else:
		print ("Erro ao salvar dados")
	
	arquivo.close()

func valor_atk ():
	var atk = attack
	return atk

func valor_agl ():
	var agl = agility
	return agl

func valor_sta ():
	var sta = stamina
	return sta

func valor_hlth ():
	var hlth = health
	return hlth

func valor_def():
	var def = defence
	return def

	
func carregar_dados():
	var arquivo = File.new()
	var erro = arquivo.open(ARQUIVO, File.READ)
	
	
	if not erro :
		var dados_salvos = arquivo.get_var()
		heroe_num = dados_salvos["heroe value"]
		attack = dados_salvos["attack value"]
		agility = dados_salvos["agility value"]
		stamina = dados_salvos["stamina value"]
		health = dados_salvos["health value"]
		defence = dados_salvos["defence value"]
		print (dados_salvos)
	else:
		print ("Erro ao salvar dados")
	
	arquivo.close()
	
	
