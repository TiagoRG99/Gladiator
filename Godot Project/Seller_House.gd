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
	print(board.attack)
	print(board.defence)

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

func set_price(x):
	if x==1:
		return 250
	elif x==2:
		return 350
	elif x==3:
		return 500
	elif x==4:
		return 750
	elif x==5:
		return 1000
	elif x==6:
		return 1250
	elif x==7:
		return 1500
	elif x==8:
		return 1750
	elif x==9:
		return 2000


	
func _on_Yes_pressed():
	$Polygon2D.visible = false
	$Yes.visible = false
	$No.visible =false
	$AttackBuy.disabled = false
	$DefenceBuy.disabled = false
	$AgilityBuy.disabled = false
	$HealthBuy.disabled = false
	$StaminaBuy.disabled = false
	
	if check == 7 && board.gold>=set_price(board.attack):
		board.attack+=1
		board.gold-=set_price(board.attack)
		board.salvar_dados()
	if check == 8 && board.gold>=set_price(board.defence):
		board.defence+=1
		board.gold-=set_price(board.defence)
		board.salvar_dados()
	if check == 9 && board.gold>=set_price(board.agility):
		board.agility+=1
		board.gold-=set_price(board.agility)
		board.salvar_dados()
	if check == 10 && board.gold>=set_price(board.health):
		board.health+=1
		board.gold-=set_price(board.health)
		board.salvar_dados()
	if check == 11 && board.gold>=set_price(board.stamina):
		board.stamina+=1
		board.gold-=set_price(board.stamina)
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
	board.check = 7
	board.salvar_dados()
	dialog()



func _on_DefenceBuy_pressed():
	board.check = 8
	board.salvar_dados()
	dialog()


func _on_AgilityBuy_pressed():
	board.check = 9
	board.salvar_dados()
	dialog()
	


func _on_HealthBuy_pressed():
	board.check = 10
	board.salvar_dados()
	dialog()


func _on_StaminaBuy_pressed():
	board.check = 11
	board.salvar_dados()
	dialog()
