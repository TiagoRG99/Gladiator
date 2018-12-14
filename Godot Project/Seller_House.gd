extends Control
var check
var potion
var price

var board = load("res://Selectchar.gd").new()

func _on_BackButton_pressed():
	get_tree().change_scene("res://NewGameScreen.tscn")

func _ready():
	$Animation_Container.show()
	$Animation_Container.seller_anim()
	board.carregar_dados()
	if board.attack==1:
		price=250
	board.carregar_dados()
	if board.attack==2:
		price=350
	board.carregar_dados()
	if board.attack==3:
		price=500
	board.carregar_dados()
	if board.attack==4:
		price=750
	board.carregar_dados()
	if board.attack==5:
		price=1000
	board.carregar_dados()
	if board.attack==6:
		price=1250
	board.carregar_dados()
	if board.attack==7:
		price=1500
	board.carregar_dados()
	if board.attack==8:
		price=1750
	board.carregar_dados()
	if board.attack==9:
		price=2000

func _process(delta):
	$Gold.text = str(board.gold)
	$Attack/LevelATT.text = str(board.attack)
	$Defence/LevelDEF.text = str(board.defence)
	$Agility/LevelAGI.text = str(board.agility)
	$Health/LevelHLT.text = str(board.health)
	$Stamina/LevelSTA.text = str(board.stamina)


func dialog():
	$Polygon2D.visible = true
	$Polygon2D/Timer.start()
	$Yes.visible = true
	$No.visible =true
	$AttackBuy.disabled = true
	$DefenceBuy.disabled = true
	$AgilityBuy.disabled = true
	$HealthBuy.disabled = true
	$StaminaBuy.disabled = true



	
func _on_Yes_pressed():
	$Polygon2D.visible = false
	$Yes.visible = false
	$No.visible =false
	$AttackBuy.disabled = false
	$DefenceBuy.disabled = false
	$AgilityBuy.disabled = false
	$HealthBuy.disabled = false
	$StaminaBuy.disabled = false
	
	if check == 7 && board.gold>=price:
		board.attack+=1
		board.gold-=price
		board.salvar_dados()
	if check == 8 && board.gold>=price:
		board.defence+=1
		board.gold-=price
		board.salvar_dados()
	if check == 9 && board.gold>=price:
		board.agility+=1
		board.gold-=price
		board.salvar_dados()
	if check == 10 && board.gold>=price:
		board.health+=1
		board.gold-=price
		board.salvar_dados()
	if check == 11 && board.gold>=price:
		board.stamina+=1
		board.gold-=price
		board.salvar_dados()


func _on_No_pressed():
	$Polygon2D.visible = false
	$Yes.visible = false
	$No.visible =false
	$AttackBuy.disabled = false
	$DefenceBuy.disabled = false
	$AgilityBuy.disabled = false
	$HealthBuy.disabled = false
	$StaminaBuy.disabled = false


func _on_AttackBuy_pressed():
	dialog()
	check = 7


func _on_DefenceBuy_pressed():
	dialog()
	check = 8


func _on_AgilityBuy_pressed():
	dialog()
	check = 9


func _on_HealthBuy_pressed():
	dialog()
	check = 10


func _on_StaminaBuy_pressed():
	dialog()
	check = 11
