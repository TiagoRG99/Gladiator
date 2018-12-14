extends Control

var board = load("res://Selectchar.gd").new()

var anim
var enemy
var enemyATT=0
var enemyDEF=0
var enemyAGI=0
var enemyHLT=0
var enemySTA=0


func _on_menuButton_pressed():
	#get_tree().change_scene("res://NewGameScreen.tscn")
	startTurn()
	
	
func _ready():
	$TextureRect/Enemy.health = 100
	$TextureRect/Player.health = 100
	anim = character_animation()
	enemy_animation()
	$TextureRect/Player.animation = "Idle_"+anim
	$TextureRect/Enemy.animation = "Idle_"+enemy
	


func enemyChar(rnd):
	if rnd==1:
		return "Elf_1Dark"
	elif rnd==2:
		return "Elf_2Dark"
	elif rnd==3:
		return "Knight_2Dark"
	elif rnd==4:
		return "Knight_3Dark"
	elif rnd==5:
		return "Amazon_1Dark"
	elif rnd==6:
		return "Amazon_2Dark"
	elif rnd==7:
		return "Amazon_2"
	elif rnd==8:
		return "Elf_2"
	elif rnd==9:
		return "Knight_2"
	elif rnd==10:
		return "Knight_3"


func rand_atributos(num):
	enemyATT=randi()%11+1
	if enemyATT>num:
		enemyATT=enemyATT-(10-num)
	enemyDEF=randi()%11+1
	if enemyDEF>5:
		enemyDEF=enemyDEF-(10-num)
	enemyDEF=randi()%11+1
	if enemyAGI>num:
		enemyAGI=enemyAGI-(10-num)
	enemyDEF=randi()%11+1
	if enemyHLT>num:
		enemyHLT=enemyHLT-(10-num)
	enemySTA=randi()%11+1
	if enemySTA>num:
		enemySTA=enemySTA-(10-num)


func character_animation():
	board.carregar_dados()
	var attack = board.valor_atk()
	var heroe = board.valor_char()
	print(attack)
	print (heroe)
	if heroe == 1:
		anim = "Elf_1"
	elif heroe == 2:
		anim = "Knight_1"
	elif heroe == 3:
		anim = "WomanWarrior_1"
	elif heroe == 10:
		anim = "Elf_2"
	elif heroe == 20:
		anim = "Knight_2"
	elif heroe == 200:
		anim = "Knight_3"
	elif heroe == 30:
		anim = "WomanWarrior_2"
	return anim

func enemy_animation():
	board.carregar_dados()
	if board.stage == 4:
		enemy="Troll_1"
		enemyATT=5
		enemyAGI=4
		enemySTA=4
		enemyDEF=5
		enemyHLT=5
	elif board.stage == 9:
		enemy = "Troll_2"
		enemyATT=8
		enemyAGI=7
		enemySTA=7
		enemyDEF=8
		enemyHLT=8
	elif board.stage == 14:
		enemy = "Troll_3"
		enemyATT=10
		enemyAGI=10
		enemySTA=10
		enemyDEF=10
		enemyHLT=10
	elif board.stage == 13:
		enemy = "Knight_2Dark"
		enemyATT=10
		enemyAGI=9
		enemySTA=8
		enemyDEF=8
		enemyHLT=9
	else:
		var random = randi()%11+1
		enemy=enemyChar(random)
		if board.stage<4:
			rand_atributos(4)
		elif board.stage>4&&board.stage<9:
			rand_atributos(7)
		elif board.stage>9&&board.stage<13:
			rand_atributos(10)



func endTurn():
	$TextureRect/TextureRect/Walk_Right.disabled = true
	$TextureRect/TextureRect/Walk_Left.disabled = true
	$TextureRect/TextureRect/Normal_Attack.disabled = true
	$TextureRect/TextureRect/Power_Attack.disabled = true

func startTurn():
	$TextureRect/TextureRect/Walk_Right.disabled = false
	$TextureRect/TextureRect/Walk_Left.disabled = false
	$TextureRect/TextureRect/Normal_Attack.disabled = false
	$TextureRect/TextureRect/Power_Attack.disabled = false
	
	
func _on_Walk_Left_pressed():
	$TextureRect/Player.animation = "Walk_"+anim
	if not $TextureRect/Player.position.x < 100:
		$TextureRect/Player.position.x = $TextureRect/Player.position.x - 20
	endTurn()
	$Timer.start()
	
func _on_Power_Attack_pressed():
	$TextureRect/Player.animation = "AttackPower_"+anim
	if $TextureRect/Player.position.x - $TextureRect/Enemy.position.x < 30:
		$TextureRect/Enemy.health = $TextureRect/Enemy.health - 50
	endTurn()
	$Timer.start()
	
func _on_Normal_Attack_pressed():
	$TextureRect/Player.animation = "AttackNormal_"+anim
	if $TextureRect/Player.position.x - $TextureRect/Enemy.position.x < 30:
		$TextureRect/Enemy.health = $TextureRect/Enemy.health - 20
	endTurn()
	$Timer.start()
	
func _on_Player_animation_finished():
	if $TextureRect/Player.animation != "Idle_"+anim and $TextureRect/Player.animation != "Die_"+anim:
		$TextureRect/Player.animation = "Idle_"+anim
		
func _on_Enemy_animation_finished():
	if $TextureRect/Enemy.animation != "Idle_"+enemy and $TextureRect/Enemy.animation != "Die_"+enemy:
		$TextureRect/Enemy.animation = "Idle_"+enemy
		
func _on_Walk_Right_pressed():
	$TextureRect/Player.animation = "Walk_"+anim
	if not $TextureRect/Enemy.position.x - $TextureRect/Player.position.x < 35:
		$TextureRect/Player.position.x = $TextureRect/Player.position.x + 20
	endTurn()
	$Timer.start()

func enemyTurn():
	if $TextureRect/Enemy.animation != "Die_"+enemy:
		if $TextureRect/Enemy.position.x - $TextureRect/Player.position.x > 100:
			$TextureRect/Enemy.animation = "Walk_"+enemy
			$TextureRect/Enemy.position.x = $TextureRect/Enemy.position.x - 20
		else :
			$TextureRect/Enemy.animation = "AttackNormal_"+enemy
			if $TextureRect/Player.position.x - $TextureRect/Enemy.position.x < 30:
				$TextureRect/Player.health = $TextureRect/Player.health - 20
		startTurn()
		
func _return_newgame():
	if $TextureRect/Player.health == 0 :
		get_tree().change_scene("res://NewGameScreen.tscn")
	if $TextureRect/Enemy.health == 0 :
		get_tree().change_scene("res://NewGameScreen.tscn")
		
func _on_Timer_timeout():
	enemyTurn()


func _on_Bag_pressed():
	$TextureRect/Polygon2D.visible = true


func _on_ExitInventory_pressed():
	$TextureRect/Polygon2D.visible = false


func _on_ButtonBigHP_pressed():
	board.carregar_dados()
	if board.health_potion_big <= 0 :
		print ("Não tens poção!")
		$TextureRect/Polygon2D.visible = false
	else:
		board.health_potion_big = board.health_potion_big - 1
		board.salvar_dados()
		$TextureRect/Polygon2D.visible = false

func _on_ButtonMediumHP_pressed():
	board.carregar_dados()
	if board.health_potion_mid <= 0:
		print ("Não tens poção!")
		$TextureRect/Polygon2D.visible = false
	else:
		board.health_potion_mid = board.health_potion_mid - 1
		board.salvar_dados()
		$TextureRect/Polygon2D.visible = false
		
		
func _on_ButtonSmallHP_pressed():
	board.carregar_dados()
	if board.health_potion_small <= 0:
		print ("Não tens poção!")
		$TextureRect/Polygon2D.visible = false
	else:
		board.health_potion_small = board.health_potion_small - 1
		board.salvar_dados()
		$TextureRect/Polygon2D.visible = false


func _on_ButtonBigStamina_pressed():
	board.carregar_dados()
	if board.stamina_potion_big <= 0:
		print ("Não tens poção!")
		$TextureRect/Polygon2D.visible = false
	else:
		board.stamina_potion_big = board.stamina_potion_big - 1
		board.salvar_dados()
		$TextureRect/Polygon2D.visible = false


func _on_ButtonMediumStamina_pressed():
	board.carregar_dados()
	if board.stamina_potion_mid <= 0:
		print ("Não tens poção!")
		$TextureRect/Polygon2D.visible = false
	else:
		board.stamina_potion_mid = board.stamina_potion_mid - 1
		board.salvar_dados()
		$TextureRect/Polygon2D.visible = false


func _on_ButtonSmallStamina_pressed():
	board.carregar_dados()
	if board.stamina_potion_small <= 0:
		print ("Não tens poção!")
		$TextureRect/Polygon2D.visible = false
	else:
		board.stamina_potion_small = board.stamina_potion_small - 1
		board.salvar_dados()
		$TextureRect/Polygon2D.visible = false
