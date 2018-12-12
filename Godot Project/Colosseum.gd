extends Control

var board = load("res://Selectchar.gd").new()

func _on_menuButton_pressed():
	#get_tree().change_scene("res://NewGameScreen.tscn")
	startTurn()



func _ready():
	$TextureRect/Enemy.health = 100
	$TextureRect/Player.health = 100
	var heroe = board.valor_char()
	


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
	$TextureRect/Player.animation = "Walk_Elf_1"
	if not $TextureRect/Player.position.x < 100:
		$TextureRect/Player.position.x = $TextureRect/Player.position.x - 20
	endTurn()
	$Timer.start()


func _on_Power_Attack_pressed():
	$TextureRect/Player.animation = "AttackPower_Elf_1"
	if $TextureRect/Player.position.x - $TextureRect/Enemy.position.x < 30:
		$TextureRect/Enemy.health = $TextureRect/Enemy.health - 50
	endTurn()
	$Timer.start()


func _on_Normal_Attack_pressed():
	$TextureRect/Player.animation = "AttackNormal_Elf_1"
	if $TextureRect/Player.position.x - $TextureRect/Enemy.position.x < 30:
		$TextureRect/Enemy.health = $TextureRect/Enemy.health - 20
	endTurn()
	$Timer.start()

func _on_Player_animation_finished():
	if $TextureRect/Player.animation != "Idle_Elf_1" and $TextureRect/Player.animation != "Die_Elf_1":
		$TextureRect/Player.animation = "Idle_Elf_1"

func _on_Enemy_animation_finished():
	if $TextureRect/Enemy.animation != "Idle_Troll_1" and $TextureRect/Enemy.animation != "Die_Troll_1":
		$TextureRect/Enemy.animation = "Idle_Troll_1"



func _on_Walk_Right_pressed():
	$TextureRect/Player.animation = "Walk_Elf_1"
	if not $TextureRect/Enemy.position.x - $TextureRect/Player.position.x < 35:
		$TextureRect/Player.position.x = $TextureRect/Player.position.x + 20
	endTurn()
	$Timer.start()

func enemyTurn():
	if $TextureRect/Enemy.animation != "Die_Troll_1":
		if $TextureRect/Enemy.position.x - $TextureRect/Player.position.x > 100:
			$TextureRect/Enemy.animation = "Walk_Troll_1"
			$TextureRect/Enemy.position.x = $TextureRect/Enemy.position.x - 20
		else :
			$TextureRect/Enemy.animation = "AttackNormal_Troll_1"
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
