extends AnimatedSprite

var health = 100

var board = load ("res://Selectchar.gd").new()

func _ready():
	board.carregar_dados()

func _process(delta):
	if health <= 0:
		if board.heroe_num == 1:
			animation = "Die_Elf_1"
		if board.heroe_num == 2:
			animation = "Die_Knight_1"
		if board.heroe_num == 3:
			animation = "Die_WomanWarrior_1"
		$Timer.start()
		health = 1


func _on_Timer_timeout():
	get_tree().change_scene("res://NewGameScreen.tscn")
