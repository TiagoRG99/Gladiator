extends Control

var potion

var board = load("res://Selectchar.gd").new()

func _ready():
	$Animation_Container.show()
	$Animation_Container.seller_anim()
	board.carregar_dados()
	#print(board.health_potion_small)
	#print(board.gold)
	#print (board.check)
	 
func _process(delta):
	$Gold.text = str(board.gold)
	
func _on_BackButton_pressed():
	get_tree().change_scene("res://NewGameScreen.tscn")
	
func dialog():
	$Polygon2D.visible = true
	$Polygon2D/Timer.start()
	$Yes.visible = true
	$No.visible =true
	$HealthPotionSmall.disabled = true
	$HealthPotionMid.disabled = true
	$HealthPotionBig.disabled = true
	$StaminaPotionSmall.disabled = true
	$StaminaPotionMid.disabled = true
	$StaminaPotionBig.disabled = true
	
func _on_HealthPotionSmall_pressed():
	board.check = 1
	board.salvar_dados()
	dialog()
	
func _on_HealthPotionMid_pressed():
	board.check = 2
	board.salvar_dados()
	dialog()

func _on_HealthPotionBig_pressed():
	board.check = 3
	board.salvar_dados()
	dialog()

func _on_StaminaPotionSmall_pressed():
	board.check = 4
	board.salvar_dados()
	dialog()

func _on_StaminaPotionMid_pressed():
	board.check = 5
	board.salvar_dados()
	dialog()

func _on_StaminaPotionBig_pressed():
	board.check = 6
	board.salvar_dados()
	dialog()

func _on_Yes_pressed():
	$Polygon2D/Timer.stop()
	$Polygon2D.visible = false
	$Yes.visible = false
	$No.visible =false
	$HealthPotionSmall.disabled = false
	$HealthPotionMid.disabled = false
	$HealthPotionBig.disabled = false
	$StaminaPotionSmall.disabled = false
	$StaminaPotionMid.disabled = false
	$StaminaPotionBig.disabled = false
	
	if board.check == 1 && board.gold >= 100 :
		board.health_potion_small+=1
		board.gold-=100
		board.salvar_dados()
	if board.check == 2 && board.gold >= 250 :
		board.health_potion_mid+=1
		board.gold-=250
		board.salvar_dados()
	if board.check == 3 && board.gold >= 500 :
		board.health_potion_big+=1
		board.gold-=500
		board.salvar_dados()
	if board.check == 4 && board.gold >= 100:
		board.stamina_potion_small+=1
		board.gold-=100
		board.salvar_dados()
	if board.check == 5 && board.gold >= 250:
		board.stamina_potion_mid+=1
		board.gold-=250
		board.salvar_dados()
	if board.check == 6 && board.gold >= 500:
		board.stamina_potion_big+=1
		board.gold-=500
		board.salvar_dados()
	else:
		print ("não tens guita!")
	
func _on_No_pressed():
	$Polygon2D/Timer.stop()
	$Polygon2D.visible = false
	$Yes.visible = false
	$No.visible =false
	$HealthPotionSmall.disabled = false
	$HealthPotionMid.disabled = false
	$HealthPotionBig.disabled = false
	$StaminaPotionSmall.disabled = false
	$StaminaPotionMid.disabled = false
	$StaminaPotionBig.disabled = false
	
