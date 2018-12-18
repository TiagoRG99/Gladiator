extends Control

var board = load("res://Selectchar.gd").new()
var board2 = load("res://Player.gd").new()

var anim
var enemy
var enemyATT=0
var enemyDEF=0
var enemyAGI=0
var enemyHLT=0
var enemySTA=0
var playerATT=0
var playerDEF=0
var playerAGI=0
var playerHLT=0
var playerSTA=0
var random
var random2
var damage

func _on_menuButton_pressed():
	#get_tree().change_scene("res://NewGameScreen.tscn")
	startTurn()

func _process(delta):
	print ()
	$TextureRect/LifePlayer/HPValue.text = str(int(player_health_calc($TextureRect/Player.health)))
	$TextureRect/LifeEnemy/HPValue2.text = str(int(enemy_health_calc($TextureRect/Enemy.health)))
	if $TextureRect/Enemy.health <= 0:
		$TextureRect/Enemy.animation = "Die_"+enemy
		$TextureRect/Enemy/Timer.start()
		$TextureRect/Enemy.health = 1
		board.stage+=1
		$TextureRect/LifeEnemy.visible=false
		$TextureRect/LifePlayer.visible=false
	if $TextureRect/Player.health <= 0:
		$TextureRect/Player.animation = "Die_"+anim
		$TextureRect/Player/Timer.start()
		$TextureRect/Player.health = 1
		$TextureRect/LifeEnemy.visible=false
		$TextureRect/LifePlayer.visible=false
		get_tree().quit()


func player_health_calc(healthCalc):
	healthCalc=(((healthCalc)*100)/playerHLT)
	return healthCalc

func enemy_health_calc(calcHealth):
	calcHealth=  (((calcHealth)*100)/enemyHLT)
	return calcHealth



func damage(att,def,power):
	random2 = randi()%11+1
	damage = (((att-def)+power)+random2)
	if (damage<0):
		damage=((1/(-damage))*100)
	return damage




func player_atributos():
	board.carregar_dados()
	#Attack
	playerATT=board.attack*board.attack
	#Defence
	playerDEF=board.defence*board.defence
	#Agility
	playerAGI=board.agility*board.agility
	#Health
	playerHLT=100+board.health*board.health
	#Stamina
	playerSTA=100+board.stamina*board.stamina

func enemy_atributos():
	#Attack
	enemyATT=enemyATT*enemyATT
	#Defence
	enemyDEF=enemyDEF*enemyDEF
	#Agility
	enemyAGI=enemyAGI*enemyAGI
	#Health
	enemyHLT=100+enemyHLT*enemyHLT
	#Stamina
	enemySTA=100+enemySTA*enemySTA


func _ready():
	randomize()
	board.carregar_dados()
	player_atributos()
	enemy_atributos()
	random = randi()%11+1
	anim = character_animation()
	enemy_animation()
	$TextureRect/Enemy.health = enemyHLT
	$TextureRect/Player.health = playerHLT
	$TextureRect/Player.animation = "Idle_"+anim
	$TextureRect/Enemy.animation = "Idle_"+enemy

func enemyChar(rnd):
	board.carregar_dados()
	if rnd==1:
		if board.heroe_num==1 || board.heroe_num==10:
			return "Knight_1"
		elif board.heroe_num==2 || board.heroe_num==20 || board.heore_num==200:
			return "Amazon_1"
		elif board.heroe_num==3 || board.heroe_num==30:
			return "Elf_1"
	elif rnd==2:
		return "Elf_1Dark"
	elif rnd==3:
		return "Elf_2Dark"
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
	board.carregar_dados()
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
	if board.heroe_num == 1:
		anim = "Elf_1"
	elif board.heroe_num == 2:
		anim = "Knight_1"
	elif board.heroe_num == 3:
		anim = "WomanWarrior_1"
	elif board.heroe_num == 10:
		anim = "Elf_2"
	elif board.heroe_num == 20:
		anim = "Knight_2"
	elif board.heroe_num == 200:
		anim = "Knight_3"
	elif board.heroe_num == 30:
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
		$TextureRect/Player.position.x = $TextureRect/Player.position.x - 40
	endTurn()
	$Timer.start()

func _on_Power_Attack_pressed():
	$TextureRect/Player.animation = "AttackPower_"+anim
	if $TextureRect/Enemy.position.x - $TextureRect/Player.position.x < 115:
		$TextureRect/Enemy.health = $TextureRect/Enemy.health - damage(playerATT,enemyDEF,40)
	endTurn()
	$Timer.start()

func _on_Normal_Attack_pressed():
	$TextureRect/Player.animation = "AttackNormal_"+anim
	if $TextureRect/Enemy.position.x - $TextureRect/Player.position.x < 115:
		$TextureRect/Enemy.health = $TextureRect/Enemy.health - damage(playerATT,enemyDEF,20)
	endTurn()
	$Timer.start()

func _on_Walk_Right_pressed():
	$TextureRect/Player.animation = "Walk_"+anim
	if not $TextureRect/Enemy.position.x - $TextureRect/Player.position.x < 35:
		$TextureRect/Player.position.x = $TextureRect/Player.position.x + 40
	endTurn()
	
	$Timer.start()

func _on_Player_animation_finished():
	if $TextureRect/Player.animation != "Idle_"+anim and $TextureRect/Player.animation != "Die_"+anim:
		$TextureRect/Player.animation = "Idle_"+anim

func _on_Enemy_animation_finished():
	if $TextureRect/Enemy.animation != "Idle_"+enemy and $TextureRect/Enemy.animation != "Die_"+enemy:
		$TextureRect/Enemy.animation = "Idle_"+enemy

func enemyTurn():
	if $TextureRect/Enemy.animation != "Die_"+enemy:
		if $TextureRect/Enemy.position.x - $TextureRect/Player.position.x > 115:
			$TextureRect/Enemy.animation = "Walk_"+enemy
			$TextureRect/Enemy.position.x = $TextureRect/Enemy.position.x - 40
		else :
			randomize()
			random = randi()%11+1
			if (random%2==0):
				$TextureRect/Enemy.animation = "AttackNormal_"+enemy
				if $TextureRect/Enemy.position.x - $TextureRect/Player.position.x < 115:
					$TextureRect/Player.health = $TextureRect/Player.health - damage(enemyATT,playerDEF,20)
			else:
				$TextureRect/Enemy.animation = "AttackPower_"+enemy
				if $TextureRect/Enemy.position.x - $TextureRect/Player.position.x < 115:
					$TextureRect/Player.health = $TextureRect/Player.health - damage(enemyATT,playerDEF,35)
		startTurn()

func _return_newgame():
	if $TextureRect/Player.health == 0 :
		get_tree().change_scene("res://NewGameScreen.tscn")
	if $TextureRect/Enemy.health == 0 :
		get_tree().change_scene("res://NewGameScreen.tscn")

func _on_Timer_timeout():
	enemyTurn()

func _on_ExitInventory_pressed():
	$TextureRect/Polygon2D.visible = false

func _on_ButtonBigHP_pressed():
	board.carregar_dados()
	if board.health_potion_big <= 0 :
		print ("Não tens poção!")
		$TextureRect/Polygon2D.visible = false
	else:
		board.health_potion_big = board.health_potion_big - 1
		$TextureRect/Player.health = playerHLT * 0.75
		board.salvar_dados()
		$TextureRect/Polygon2D.visible = false

func _on_ButtonMediumHP_pressed():
	board.carregar_dados()
	if board.health_potion_mid <= 0:
		print ("Não tens poção!")
		$TextureRect/Polygon2D.visible = false
	else:
		board.health_potion_mid = board.health_potion_mid - 1
		$TextureRect/Player.health = playerHLT * 0.5
		board.salvar_dados()
		$TextureRect/Polygon2D.visible = false

func _on_ButtonSmallHP_pressed():
	board.carregar_dados()
	if board.health_potion_small <= 0:
		print ("Não tens poção!")
		$TextureRect/Polygon2D.visible = false
	else:
		board.health_potion_small = board.health_potion_small - 1
		$TextureRect/Player.health = playerHLT * 0.25
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

func _on_Inventory_pressed():
	board.carregar_dados()
	$TextureRect/Polygon2D.visible = true
	$TextureRect/Polygon2D/ButtonBigHP/BigHPValue.text = str(board.health_potion_big)
	$TextureRect/Polygon2D/ButtonMediumHP/MediumHPValue.text = str(board.health_potion_mid)
	$TextureRect/Polygon2D/ButtonSmallHP/SmallHPValue.text = str(board.health_potion_small)
	$TextureRect/Polygon2D/ButtonBigStamina/BigStaminaValue.text = str(board.stamina_potion_big)
	$TextureRect/Polygon2D/ButtonMediumStamina/MediumStaminaValue.text = str(board.stamina_potion_mid)
	$TextureRect/Polygon2D/ButtonSmallStamina/SmallStaminaValue.text = str(board.stamina_potion_small)