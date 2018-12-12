extends Control
var check
var potion

var board = load("res://Selectchar.gd").new()

func _on_BackButton_pressed():
	get_tree().change_scene("res://NewGameScreen.tscn")

func _ready():
	$Animation_Container.show()
	$Animation_Container.seller_anim()
	board.carregar_dados()
	print(board.health_potion_small)
	print(board.gold)


func dialog():
	$Polygon2D.visible = true
	$Polygon2D/Timer.start()
	$Yes.visible = true
	$No.visible =true
	$HealthPotionSmall.visible = false
	$HealthPotionMid.visible = false
	$HealthPotionBig.visible = false
	$StaminaPotionSmall.visible = false
	$StaminaPotionMid.visible = false
	$StaminaPotionBig.visible = false


func _on_HealthPotionSmall_pressed():
	dialog()
	check = 1


func _on_HealthPotionMid_pressed():
	dialog()
	check = 2


func _on_HealthPotionBig_pressed():
	dialog()
	check = 3


func _on_StaminaPotionSmall_pressed():
	dialog()
	check = 4


func _on_StaminaPotionMid_pressed():
	dialog()
	check = 5


func _on_StaminaPotionBig_pressed():
	dialog()
	check = 6



func _on_Yes_pressed():
	$Polygon2D.visible = false
	$Yes.visible = false
	$No.visible =false
	$HealthPotionSmall.visible = true
	$HealthPotionMid.visible = true
	$HealthPotionBig.visible = true
	$StaminaPotionSmall.visible = true
	$StaminaPotionMid.visible = true
	$StaminaPotionBig.visible = true
	
	if check == 1:
		board.health_potion_small+=1
		board.gold-=20
		board.salvar_dados()
	if check == 2:
		board.health_potion_mid+=1
		board.gold-=20
		board.salvar_dados()
	if check == 3:
		board.health_potion_big+=1
		board.gold-=20
		board.salvar_dados()
	if check == 4:
		board.stamina_potion_small+=1
		board.gold-=20
		board.salvar_dados()
	if check == 5:
		board.stamina_potion_mid+=1
		board.gold-=20
		board.salvar_dados()
	if check == 6:
		board.stamina_potion_big+=1
		board.gold-=20
		board.salvar_dados()
	


func _on_No_pressed():
	$Polygon2D.visible = false
	$Yes.visible = false
	$No.visible =false
	$HealthPotionSmall.visible = true
	$HealthPotionMid.visible = true
	$HealthPotionBig.visible = true
	$StaminaPotionSmall.visible = true
	$StaminaPotionMid.visible = true
	$StaminaPotionBig.visible = true
