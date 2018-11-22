extends Control



func _on_menuButton_pressed():
	#get_tree().change_scene("res://NewGameScreen.tscn")
	startTurn()



func _ready():
	$TextureRect/Enemy.health = 100
	$TextureRect/Player.health = 100


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


func _on_Power_Attack_pressed():
	$TextureRect/Player.animation = "AttackPower_Elf_1"
	$TextureRect/Player.position.x = $TextureRect/Player.position.x + 5
	if $TextureRect/Player.position.x - $TextureRect/Enemy.position.x < 30:
		$TextureRect/Enemy.health = $TextureRect/Enemy.health - 50
	endTurn()


func _on_Normal_Attack_pressed():
	$TextureRect/Player.animation = "AttackNormal_Elf_1"
	$TextureRect/Player.position.x = $TextureRect/Player.position.x + 5
	if $TextureRect/Player.position.x - $TextureRect/Enemy.position.x < 30:
		$TextureRect/Enemy.health = $TextureRect/Enemy.health - 20
	endTurn()



func _on_Walk_Right_pressed():
	$TextureRect/Player.animation = "Walk_Elf_1"
	if not $TextureRect/Enemy.position.x - $TextureRect/Player.position.x < 35:
		$TextureRect/Player.position.x = $TextureRect/Player.position.x + 20
	endTurn()



func _on_Player_animation_finished():
	if $TextureRect/Player.animation != "Idle_Elf_1":
		$TextureRect/Player.animation = "Idle_Elf_1"
