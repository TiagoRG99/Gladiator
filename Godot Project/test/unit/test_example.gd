extends "res://addons/gut/test.gd"

var MyObj = load ("res://TitleScreen.gd").new()
var MyObj2 = load ("res://Selectchar.gd").new()
var MyObj3 = load ("res://Seller_House.gd").new()
var MyObj4 = load ("res://Colosseum.gd").new()

func before_each():
	gut.p("ran setup", 2)

func after_each():
	gut.p("ran teardown", 2)

func before_all():
	gut.p("ran run setup", 2)

func after_all():
	gut.p("ran run teardown", 2)

func test_assert_eq_number_not_equal():
	assert_eq(1, 2, "Should fail.  1 != 2")

func test_assert_eq_number_equal():
	assert_eq('asdf', 'asdf', "Should pass")

func test_assert_true_with_true():
	assert_true(true, "Should pass, true is true")

func test_assert_true_with_false():
	assert_true(false, "Should fail")

func test_something_else():
	assert_true(false, "didn't work")
	
# Selectchar
func test_salvar_dados():
	var ad = MyObj2.salvar_dados()
	assert_eq(2,ad, "Devia passar!")

func test_carregar_dados():
	var ad = MyObj2.carregar_dados()
	assert_eq(4,ad, "Devia passar!")

#SellerHouse
func test_set_price():
	var ad = MyObj3.set_price(1)
	assert_eq(250,ad, "Devia passar!")
	var ad2 = MyObj3.set_price(4)
	assert_eq(750,ad2, "Devia passar!")
	var ad3 = MyObj3.set_price(8)
	assert_eq(1750,ad3, "Devia passar!")
	
#Colosseum
func test_enemyChar():
	var ad = MyObj4.enemyChar(2)
	assert_eq("Elf_1Dark",ad, "Devia passar!")
	var ad2 = MyObj4.enemyChar(7)
	assert_eq("Amazon_2",ad2, "Devia passar!")
	var ad3 = MyObj4.enemyChar(10)
	assert_eq("Knight_3",ad3, "Devia passar!")
	
func test_character_animation():
	var ad = MyObj4.character_animation()
	assert_eq("ASDF",ad, "Deve falhar")
	
func test_gold_won():
	var ad = MyObj4.gold_won(1)
	assert_eq(1250,ad, "Deve passar!")
	var ad2 = MyObj4.gold_won(5)
	assert_eq(2000,ad2, "Deve passar!")
	var ad3 = MyObj4.gold_won(13)
	assert_eq(7000,ad3, "Deve passar!")
	