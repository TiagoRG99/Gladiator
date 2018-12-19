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
var agi_effect
var check=0


func _process(delta):
	if ($TextureRect/TextureRect/Walk_Left.disabled==false):
		if Input.is_action_just_pressed("ui_left"):
			_on_Walk_Left_pressed()
		if Input.is_action_just_pressed("ui_right"):
			_on_Walk_Right_pressed()
		if Input.is_action_just_pressed("ui_down"):
			_on_Normal_Attack_pressed()
		if Input.is_action_just_pressed("ui_up"):
			_on_Power_Attack_pressed()
	$TextureRect/LifePlayer/HPValue.text = str(int(player_health_calc($TextureRect/Player.health)))
	$TextureRect/LifeEnemy/HPValue2.text = str(int(enemy_health_calc($TextureRect/Enemy.health)))
	$TextureRect/StaminaPlayer/StaminaValue.text = str (int(player_stamina_calc($TextureRect/Player.stamina)))
	if $TextureRect/Enemy.health <= 0:
		$TextureRect/Enemy.animation = "Die_"+enemy
		$TextureRect/Enemy/Timer.start()
		$GameOver_Win.text= "VICTORY!"
		$GameOver_Win.visible = true
		board.gold+=gold_won(board.stage)
		board.salvar_dados()
		$TextureRect/Enemy.health = 1
		board.stage+=1
		$TextureRect/LifeEnemy.visible=false
		$TextureRect/LifePlayer.visible=false
		$TextureRect/StaminaPlayer.visible = false
	if $TextureRect/Player.health <= 0:
		$TextureRect/Player.animation = "Die_"+anim
		$TextureRect/Player/Timer.start()
		$GameOver_Win.text= "GAME OVER!"
		$GameOver_Win.visible = true
		$TextureRect/Player.health = 1
		$TextureRect/LifeEnemy.visible=false
		$TextureRect/LifePlayer.visible=false
		$TextureRect/StaminaPlayer.visible = false

func player_health_calc(healthCalc):
	healthCalc=(((healthCalc)*100)/playerHLT)
	return healthCalc

func enemy_health_calc(calcHealth):
	calcHealth=  (((calcHealth)*100)/enemyHLT)
	return calcHealth

func player_stamina_calc(StaminaCalc):
	StaminaCalc =  (((StaminaCalc)*100)/playerSTA)
	return StaminaCalc

func damage(att,def,power):
	randomize()
	random2 = randi()%11+1
	damage = (((att-def)+power)+random2)
	if (damage<0):
		damage=((1/(-damage))*100)
	return damage

func verificaStamina():
	if $TextureRect/Player.stamina <= 0:
		$TextureRect/Player.stamina = 0 + 17
		endTurn()
	if $TextureRect/Player.stamina >= 100:
		$TextureRect/Player.stamina = 101

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
	$TextureRect/Player.stamina = playerSTA
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
	elif rnd==0:
		return "Knight_3Dark"
	elif rnd==11:
		return "Elf_2Dark"

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
		enemyHLT=105
	elif board.stage == 9:
		enemy = "Troll_2"
		enemyATT=8
		enemyAGI=7
		enemySTA=7
		enemyDEF=8
		enemyHLT=108
	elif board.stage == 14:
		enemy = "Troll_3"
		enemyATT=10
		enemyAGI=10
		enemySTA=10
		enemyDEF=10
		enemyHLT=110
	elif board.stage == 13:
		enemy = "Knight_2Dark"
		enemyATT=10
		enemyAGI=9
		enemySTA=8
		enemyDEF=8
		enemyHLT=109
	else:
		enemy=enemyChar(random)
		if board.stage<4:
			rand_atributos(4)
		elif board.stage>4 && board.stage<9:
			rand_atributos(7)
		elif board.stage>9 && board.stage<13:
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
		check=2
		$TextureRect/Player.position.y = $TextureRect/Player.position.y - 2
		$Timer2.start()
		$TextureRect/Player.position.x = $TextureRect/Player.position.x - 40
		$TextureRect/Player.stamina = $TextureRect/Player.stamina - 9
	verificaStamina()
	endTurn()
	$Timer.start()

func agility_effect(attType,atributo):
	randomize()
	random2 = randi()%11+1
	agi_effect= ((atributo/10)+(random/2))+attType
	return agi_effect

func _on_Power_Attack_pressed():
	randomize()
	random = randi()%101+1
	$TextureRect/Player.animation = "AttackPower_"+anim
	if $TextureRect/Enemy.position.x - $TextureRect/Player.position.x < 115:
		randomize()
		random = randi()%101+1
		if agility_effect(20,enemyAGI)<random:
			$TextureRect/Enemy.health = $TextureRect/Enemy.health - damage(playerATT,enemyDEF,40)
			$TextureRect/Player.stamina = $TextureRect/Player.stamina - 30
		else:
			$MissPower.visible=true
	else :
		$TextureRect/Player.stamina = $TextureRect/Player.stamina - 30
	#$TextureRect/Player.position.x = $TextureRect/Player.position.x - 5
	verificaStamina()
	endTurn()
	$Timer.start()

func _on_Normal_Attack_pressed():
	$TextureRect/Player.animation = "AttackNormal_"+anim
	if $TextureRect/Enemy.position.x - $TextureRect/Player.position.x < 115:
		randomize()
		random = randi()%101+1
		if agility_effect(2,enemyAGI)<random:
			$TextureRect/Enemy.health = $TextureRect/Enemy.health - damage(playerATT,enemyDEF,20)
			$TextureRect/Player.stamina = $TextureRect/Player.stamina - 16
		else:
			$MissNormal.visible=true
	else :
		$TextureRect/Player.stamina = $TextureRect/Player.stamina - 16
	verificaStamina()
	endTurn()
	$Timer.start()

func _on_Walk_Right_pressed():
	$TextureRect/Player.animation = "Walk_"+anim
	if not $TextureRect/Enemy.position.x - $TextureRect/Player.position.x < 35:
		check=1
		$TextureRect/Player.position.y = $TextureRect/Player.position.y - 2
		$Timer2.start()
		$TextureRect/Player.stamina = $TextureRect/Player.stamina - 9
	verificaStamina()
	endTurn()
	
	$Timer.start()

func _on_Player_animation_finished():
	if $TextureRect/Player.animation != "Idle_"+anim and $TextureRect/Player.animation != "Die_"+anim:
		$TextureRect/Player.animation = "Idle_"+anim

func _on_Enemy_animation_finished():
	if $TextureRect/Enemy.animation != "Idle_"+enemy and $TextureRect/Enemy.animation != "Die_"+enemy:
		$TextureRect/Enemy.animation = "Idle_"+enemy

func enemyTurn():
	$MissNormal.visible=false
	$MissPower.visible=false
	randomize()
	random2=randi()%11+1
	if $TextureRect/Enemy.animation != "Die_"+enemy:
		if $TextureRect/Enemy.position.x - $TextureRect/Player.position.x > 115:
			if random2==10 || random2==1:
				$TextureRect/Enemy.animation = "Walk_"+enemy
				check=3
				$TextureRect/Enemy.position.y = $TextureRect/Enemy.position.y - 2
				$Timer2.start()
				$TextureRect/Enemy.position.x = $TextureRect/Enemy.position.x + 40
			else:
				$TextureRect/Enemy.animation = "Walk_"+enemy
				check=4
				$TextureRect/Enemy.position.y = $TextureRect/Enemy.position.y - 2
				$Timer2.start()
				$TextureRect/Enemy.position.x = $TextureRect/Enemy.position.x - 40
		else :
			randomize()
			random = randi()%11+1
			if (random%2==0):
				$TextureRect/Enemy.animation = "AttackNormal_"+enemy
				if $TextureRect/Enemy.position.x - $TextureRect/Player.position.x < 115:
					randomize()
					random = randi()%101+1
					if agility_effect(2,playerAGI)<random:
						$TextureRect/Player.health = $TextureRect/Player.health - damage(enemyATT,playerDEF,20)
			else:
				$TextureRect/Enemy.animation = "AttackPower_"+enemy
				if $TextureRect/Enemy.position.x - $TextureRect/Player.position.x < 115:
					randomize()
					random = randi()%101+1
					if agility_effect(20,playerAGI)<random:
						$TextureRect/Player.health = $TextureRect/Player.health - damage(enemyATT,playerDEF,35)
		$TextureRect/Player.stamina = $TextureRect/Player.stamina + 7
		verificaStamina()
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
		$TextureRect/Player.stamina = playerSTA * 0.75
		board.salvar_dados()
		$TextureRect/Polygon2D.visible = false

func _on_ButtonMediumStamina_pressed():
	board.carregar_dados()
	if board.stamina_potion_mid <= 0:
		print ("Não tens poção!")
		$TextureRect/Polygon2D.visible = false
	else:
		board.stamina_potion_mid = board.stamina_potion_mid - 1
		$TextureRect/Player.stamina = playerSTA * 0.5
		board.salvar_dados()
		$TextureRect/Polygon2D.visible = false

func _on_ButtonSmallStamina_pressed():
	board.carregar_dados()
	if board.stamina_potion_small <= 0:
		print ("Não tens poção!")
		$TextureRect/Polygon2D.visible = false
	else:
		board.stamina_potion_small = board.stamina_potion_small - 1
		$TextureRect/Player.stamina = playerSTA * 0.25
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

func _on_Timer2_timeout():
	if check==1:
		$TextureRect/Player.position.x = $TextureRect/Player.position.x + 20
		$Timer3.start()
	elif check==2:
		$TextureRect/Player.position.x = $TextureRect/Player.position.x - 20
		$Timer3.start()
	elif check==3:
		$TextureRect/Enemy.position.x = $TextureRect/Enemy.position.x + 20
		$Timer3.start()
	elif check==4:
		$TextureRect/Enemy.position.x = $TextureRect/Enemy.position.x - 20
		$Timer3.start()

func _on_Timer3_timeout():
	if check==1:
		$TextureRect/Player.position.x = $TextureRect/Player.position.x + 20
	elif check==2:
		$TextureRect/Player.position.x = $TextureRect/Player.position.x - 20
	elif check==3:
		$TextureRect/Enemy.position.x = $TextureRect/Enemy.position.x + 20
	elif check==4:
		$TextureRect/Enemy.position.x = $TextureRect/Enemy.position.x - 20

func gold_won(stage):
	if stage==0:
		return 1000
	elif stage==1:
		return 1250
	elif stage==2:
		return 1500
	elif stage==3:
		return 1750
	elif stage==4:
		return 2500
	elif stage==5:
		return 2000
	elif stage==6:
		return 2500
	elif stage==7:
		return 3000
	elif stage==8:
		return 3500
	elif stage==9:
		return 5000
	elif stage==10:
		return 4000
	elif stage==11:
		return 5000
	elif stage==12:
		return 6000
	elif stage==13:
		return 7000
	elif stage==14:
		return 10000