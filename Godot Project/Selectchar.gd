extends Control

var heroe_num = 1
var heroe_count = 3
var attack
var agility
var stamina
var health
var defence
var health_potion_small = 0
var health_potion_mid = 0
var health_potion_big = 0
var stamina_potion_small = 0
var stamina_potion_mid = 0
var stamina_potion_big = 0
var gold = 0
var check

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
		$VBoxContainer/Class/LabelName.text = "Amazon"
		$VBoxContainer/Class2/LabelAttack.text = "2"
		$VBoxContainer/Class3/LabelAgility.text = "2"
		$VBoxContainer/Class4/LabelStamina.text = "2"
		$VBoxContainer/Class5/LabelHealth.text = "1"
		$VBoxContainer/Class6/LabelDefence.text = "2"


func _ready():

	$player.set_texture(load("res://Sprites PI/Selectchar/heroe_" + str(heroe_num) + ".png"))
	health_potion_small = 0
	health_potion_mid = 0
	health_potion_big = 0
	stamina_potion_small = 0
	stamina_potion_mid = 0
	stamina_potion_big = 0
	gold=0
	check = 0
	salvar_dados()

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
	
	var dados = {"heroe value":heroe_num, "atributos": {"attack value":attack, "agility value":agility, "stamina value":stamina, "health value":health, "defence value":defence}, "potions": {"health_potion_small value":health_potion_small, "health_potion_mid value":health_potion_mid, "health_potion_big value":health_potion_big,"stamina_potion_small value":stamina_potion_small, "stamina_potion_mid value":stamina_potion_mid, "stamina_potion_big value":stamina_potion_big}, "gold value":gold, "check value": check}
	
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

func valor_hlth_pot_small():
	var hlth_pot = health_potion_small
	return hlth_pot

func valor_hlth_pot_mid():
	var hlth_pot = health_potion_mid
	return hlth_pot

func valor_hlth_pot_big():
	var hlth_pot = health_potion_big
	return hlth_pot

func valor_sta_pot_small():
	var sta_pot = stamina_potion_small
	return sta_pot

func valor_sta_pot_mid():
	var sta_pot = stamina_potion_mid
	return sta_pot

func valor_sta_pot_big():
	var sta_pot = stamina_potion_big
	return sta_pot

func carregar_dados():
	var arquivo = File.new()
	var erro = arquivo.open(ARQUIVO, File.READ)
	
	
	if not erro :
		var dados_salvos = arquivo.get_var()
		heroe_num = dados_salvos["heroe value"]
		attack = dados_salvos["atributos"]["attack value"]
		agility = dados_salvos["atributos"]["agility value"]
		stamina = dados_salvos["atributos"]["stamina value"]
		health = dados_salvos["atributos"]["health value"]
		defence = dados_salvos["atributos"]["defence value"]
		health_potion_small = dados_salvos["potions"]["health_potion_small value"]
		health_potion_mid = dados_salvos["potions"]["health_potion_mid value"]
		health_potion_big = dados_salvos["potions"]["health_potion_big value"]
		stamina_potion_small = dados_salvos["potions"]["stamina_potion_small value"]
		stamina_potion_mid = dados_salvos["potions"]["stamina_potion_mid value"]
		stamina_potion_big = dados_salvos["potions"]["stamina_potion_big value"]
		gold = dados_salvos["gold value"]
		check = dados_salvos ["check value"]
		#print (dados_salvos)
	else:
		print ("Erro ao salvar dados")
	
	arquivo.close()

